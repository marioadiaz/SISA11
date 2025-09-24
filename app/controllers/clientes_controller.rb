class ClientesController < ApplicationController
before_action :set_cliente, only: [:show, :edit, :update, :delete]

  def index
    #@clientes = Cliente.all.order(:apellido)
    @clientes = Cliente.search(params[:search]).paginate(:page => params[:page], :per_page => 10 )
                         .order("updated_at DESC, nombre DESC")

    respond_to do |format|
      format.html
      format.json
      format.pdf do
          render pdf: "file_name", :template => 'clientes/listado_clientes.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end

  end

  def new
    @cliente = Cliente.new
  end

  def show
    cliente_id = params[:id]
    @cliente = Cliente.find(cliente_id)
  end

  def create
    @cliente = Cliente.new(cliente_params)

    @cliente.update baja: true

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_path, notice: 'El cliente fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @cliente }

        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "create"
        @seguimiento.registro_procesado = "Cliente : " + cliente_params.to_s
        @seguimiento.accion = Time.now.to_s + " Cliente.new(cliente_params)"
        @seguimiento.save

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

        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "update"
        @seguimiento.registro_procesado = "Cliente : " + cliente_params.to_s
        @seguimiento.accion = Time.now.to_s + " Cliente.find(params[:id])"
        @seguimiento.save

      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @cliente = Cliente.find(params[:id])

    @cliente.update baja: false
        puts "---------------------@cliente.id: "
        puts @cliente.id
        puts "---------------------@cliente.cuit: "
        puts @cliente.cuit
        puts "---------------------@cliente.baja: "
        puts @cliente.baja

    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "delete"
    @seguimiento.registro_procesado = "Cliente : " + @cliente.id.to_s
    @seguimiento.accion = Time.now.to_s + " Cliente.find(params[:id])"
    @seguimiento.save
          
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'El cliente fue eliminado.' }
      format.json { head :no_content }
    end
  end


  #DEFINO EL BUSCADOR PARA EL MODAL EN ORDEN_FUMIGACION
  def buscador

    @resultados = Cliente.search(params[:termino]).map do |cliente|
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
      params.require(:cliente).permit(:cuit, :rubro, :apellido, :nombre, :domicilio, :barrio, :localidad, :celular, :telefono, :correo, :observaciones_cliente, :tipo_cliente, :calificacion, :baja)
    end
end
