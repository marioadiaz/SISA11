class OrdenFumigacionsController < ApplicationController
before_action :set_orden_fumigacion, only: [ :show, :showfajas, :edit, :update, :delete, :add_cliente]

  def index
    @orden_fumigacions = OrdenFumigacion.all.order(:nro_certificado)
    respond_to do |format|
      format.html
      format.js
      format.pdf do
          render pdf: "file_name", :template => 'orden_fumigacions/listado.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end
  end


def proximas_fumigaciones
    @date_method = (params[:search].present? ? params[:search][:date_method] : 'fecha_aplicacion').to_sym
    @start = selected_date(:start_date)
    @end = selected_date(:end_date)

    @orden_fumigacions = params[:search].present? ? OrdenFumigacion.where(@date_method => @start..@end) : OrdenFumigacion.none
end

  def new
    @orden_fumigacion = OrdenFumigacion.new
  end

  def show
    # No lo usamos en este modelo
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "file_name", :template => 'orden_fumigacions/certificado.pdf.erb',
        encoding: 'utf8',
        orientation: 'Portrait',
        page_size: 'A4',:print_media_type => true
      end

    end
  end

  def showfajas
    # No lo usamos en este modelo
    @orden_fumigacion = OrdenFumigacion.find(params[:nro_certificado])
    puts "---------------------@orden_fumigacion.nro_certificado: "
    puts @orden_fumigacion.nro_certificado
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "file_name", :template => 'orden_fumigacions/faja.pdf.erb',

        encoding: 'utf8',
        orientation: 'Portrait',
        page_size: 'A4',:print_media_type => true
      end

      #  format.pdf do
      #      render pdf: "file_name", :template => 'orden_fumigacions/faja.pdf.erb',
      #      encoding: 'utf8',
      #      orientation: 'Landscape',
      #      page_size: 'A4',:print_media_type => true
      #  end
    end
  end

  def create
    @orden_fumigacion = OrdenFumigacion.new(orden_fumigacion_params)

    @orden_fumigacion.update baja: true

    respond_to do |format|
      if @orden_fumigacion.save!
        format.html { redirect_to orden_fumigacions_path, notice: 'La orden_fumigacion fue exitosamente creada.' }
        format.json { render :show, status: :created, location: @orden_fumigacion }
      else
        format.html { render :new }
        format.json { render json: @orden_fumigacion.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
  end

  def update
        @orden_fumigacion = OrdenFumigacion.find(params[:id])
      if @orden_fumigacion.update(orden_fumigacion_params)
        redirect_to orden_fumigacions_path
        puts "---------------------@orden_fumigacion.tratamiento: "
        puts @orden_fumigacion.tratamiento
        puts "---------------------@orden_fumigacion.vector: "
        puts @orden_fumigacion.vector
        puts "---------------------@orden_fumigacion.veneno: "
        puts @orden_fumigacion.veneno
        puts "---------------------@orden_fumigacion.droga: "
        puts @orden_fumigacion.droga

      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    @orden_fumigacion.update baja: false
    respond_to do |format|
      format.html { redirect_to orden_fumigacions_url, notice: 'La orden_fumigacion fue eliminada.' }
      format.json { head :no_content }
    end
  end

  def add_cliente

    @cliente = Cliente.find(params[:cliente_id])

    if @cliente.present?

        result = { apellido: @cliente.try(:apellido)}
        puts "result: "
        puts result
        respond_to do |format|
        if @cliente.valid?
            format.json { render json: result }
          else
            format.json { render json: @cliente.errors.full_messages, status: :unprocessable_entity }
          end
        end
    else
      render json: { message: "El cliente no se encontr??" }, status: :not_found
    end
  end

  def add_tecnico

    @tecnico = Tecnico.find(params[:tecnico_id])

    if @tecnico.present?

        result = { apellido: @tecnico.try(:apellido) }
        puts "result: "
        puts result
        respond_to do |format|
        if @tecnico.valid?
            format.json { render json: result }
          else
            format.json { render json: @tecnico.errors.full_messages, status: :unprocessable_entity }
          end
        end
    else
      render json: { message: "El tecnico no se encontr??" }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_fumigacion
      @orden_fumigacion = OrdenFumigacion.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def orden_fumigacion_params
      params.require(:orden_fumigacion).permit(:cliente_id, :tecnico_id, :nro_ordfumigacion, :nro_certificado, :tipo_certificado, :fecha_aplicacion, :hora_aplicacion, :tratamiento, :vector, :superficie, :veneno, :droga, :observaciones_ordfumigacion, :fecha_vencimiento, :proximo_tratamiento, :importe, :estado, :baja)
    end



    def selected_date(symbol)
    params[:search].present? && params[:search][symbol].present? ? params[:search][symbol].to_date : Time.now.to_date
end
end
