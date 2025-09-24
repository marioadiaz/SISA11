class NotesController < ApplicationController
before_action :set_note, only: [:show, :edit, :update, :delete]

  def index
      @notes = Note.all.order("updated_at DESC")
      respond_to do |format|
      format.html
      format.json
      format.pdf do
          render pdf: "file_name", :template => 'notes/listado_notes.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @note = Note.new(note_params)
    
    @note.update baja: true

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'La note fue exitosamente creada.' }
        format.json { render :show, status: :created, location: @note }
        
        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "create"
        @seguimiento.registro_procesado = "Note : " + note_params.to_s
        @seguimiento.accion = Time.now.to_s + " "
        @seguimiento.save

      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
        @note = Note.find(params[:id])
        @note.fecha_finalizacion = Date.today

        puts "---------note_params : "
        puts note_params

      if @note.update(note_params)
        redirect_to notes_path

        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "update"
        @seguimiento.registro_procesado = "Note : " + note_params.to_s
        @seguimiento.accion = Time.now.to_s + " "
        @seguimiento.save  

      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @note = Note.find(params[:id])
    @note.update baja: false

    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "delete"
    @seguimiento.registro_procesado = "Note : " + @note.id.to_s
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save

    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'La note fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:usuario_inicia, :turno, :fecha_inicio, :descripcion_novedad, :usuario_finaliza, :fecha_finalizacion, :estado, :baja)
    end
end