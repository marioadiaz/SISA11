class ClientesController < ApplicationController
before_action :set_cliente, only: [:show, :edit, :update, :delete]

  def index
      @clientes = Cliente.all.order(:apellido)
      respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'clientes/pdf', pdf: 'Reporte'
      end
    end
  end

  def new
    @cliente = Cliente.new
  end

  def show
    # No lo usamos en este modelo
  end

  def create
    @cliente = Cliente.new(cliente_params)

    @cliente.update baja: true

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_path, notice: 'El cliente fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
        @cliente = Cliente.find(params[:id])
      if @cliente.update(cliente_params)
        redirect_to clientes_path
      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @cliente = Cliente.find(params[:id])
    @cliente.update baja: false
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'El cliente fue eliminado.' }
      format.json { head :no_content }
    end
  end

  #DEFINO EL BUSCADOR PARA EL MODAL EN ORDEN_FUMIGACION
  def buscador

    @resultados = Cliente.buscador(params[:termino]).map do |cliente|
      {
          id: cliente.id,
          apellido: cliente.apellido
      }
    end

    respond_to do |format|
      format.json { render :json => @resultados }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:cuit, :rubro, :apellido, :nombre, :domicilio, :barrio, :celular, :telefono, :correo, :observaciones_cliente, :tipo_cliente, :calificacion, :baja)
    end
end
