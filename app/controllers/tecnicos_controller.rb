class TecnicosController < ApplicationController

  def index
      @tecnicos = Tecnico.all.order(:apellido)
      respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'tecnicos/pdf', pdf: 'Reporte'
      end
    end
  end

  def new
    @tecnico = Tecnico.new
  end

  def show
  end

  def create
    @tecnico = Tecnico.new(tecnico_params)

    @tecnico.update baja: true

    respond_to do |format|
      if @tecnico.save
        format.html { redirect_to tecnicos_path, notice: 'El tecnico fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @tecnico }
      else
        format.html { render :new }
        format.json { render json: @tecnico.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tecnico = Tecnico.find(params[:id])
  end

  def update
    @tecnico = Tecnico.find(params[:id])
      if @tecnico.update(tecnico_params)
        redirect_to tecnicos_path
      else
        render :edit
      end
  end

  def delete
    @tecnico = Tecnico.find(params[:id])
    @tecnico.update baja: false
    respond_to do |format|
      format.html { redirect_to tecnicos_url, notice: 'El tecnico fue eliminado.' }
      format.json { head :no_content }
    end
  end

  #DEFINO EL BUSCADOR PARA EL MODAL EN ORDEN_FUMIGACION
  def buscador
    @resultados = Tecnico.buscador(params[:termino]).map do |tecnico|
      {
          id: tecnico.id,
          cuit_tecnico: tecnico.cuit,
          apellido_tecnico: tecnico.apellido
      }
    end

    respond_to do |format|
      format.json { render :json => @resultados }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @tecnico = Tecnico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tecnico_params
      params.require(:tecnico).permit(:dni, :apellido, :nombre, :domicilio, :barrio, :celular, :telefono, :correo, :observaciones_tecnico, :baja)
    end
end
