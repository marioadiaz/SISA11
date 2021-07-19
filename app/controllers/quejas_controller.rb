class QuejasController < ApplicationController
before_action :set_queja, only: [:show, :edit, :update, :delete]

  def index
      @quejas = Queja.all.order("updated_at DESC")
      respond_to do |format|
      format.html
      format.json
      format.pdf do
          render pdf: "file_name", :template => 'quejas/listado_reclamos.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end
  end

  def new
    @queja = Queja.new
  end

  def show
    # No lo usamos en este modelo
  end

  def create
    @queja = Queja.new(queja_params)

    @queja.update baja: true

    respond_to do |format|
      if @queja.save
        format.html { redirect_to quejas_path, notice: 'La queja fue exitosamente creada.' }
        format.json { render :show, status: :created, location: @queja }
        
        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "create"
        @seguimiento.registro_procesado = "Queja : " + queja_params.to_s
        @seguimiento.accion = Time.now.to_s + " "
        @seguimiento.save

      else
        format.html { render :new }
        format.json { render json: @queja.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @queja = Queja.find(params[:id])
  end

  def update
        @queja = Queja.find(params[:id])
        @queja.fecha_finalizacion = Date.today

        puts "---------queja_params : "
        puts queja_params

      if @queja.update(queja_params)
        redirect_to quejas_path

        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "update"
        @seguimiento.registro_procesado = "Queja : " + queja_params.to_s
        @seguimiento.accion = Time.now.to_s + " "
        @seguimiento.save  

      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @queja = Queja.find(params[:id])
    @queja.update baja: false

    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "delete"
    @seguimiento.registro_procesado = "Queja : " + @queja.id.to_s
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save

    respond_to do |format|
      format.html { redirect_to quejas_url, notice: 'La queja fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queja
      @queja = Queja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queja_params
      params.require(:queja).permit(:orden_fumigacion_id, :nro_queja, :fecha_queja, :fecha_finalizacion, :observaciones_queja, :observacion_final, :estado, :baja)
    end
end
