class OrdenFumigacionsController < ApplicationController
before_action :set_orden_fumigacion, only: [ :show, :showfajas, :edit, :update, :anular, :delete, :copy]

  def index
    #@orden_fumigacions = OrdenFumigacion.all.order("nro_certificado DESC")
    @orden_fumigacions = OrdenFumigacion.search(params[:search]).paginate(:page => params[:page], :per_page => 35 )
                         .order('nro_ordfumigacion DESC, ltr_of DESC')

    respond_to do |format|
      format.html
      format.js
      format.pdf do
          render pdf: "listado_fumigaciones", :template => 'orden_fumigacions/listado_fumigaciones.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end

  end

  def copy
    @orden_fumigacion_actual = OrdenFumigacion.find(params[:id])
    @orden_fumigacion = @orden_fumigacion_actual.dup
    @orden_fumigacion.nro_certificado = 0

    render :new

  end

  def fumigaciones_por_cliente
      @cliente_id = params[:id]
      @cliente = Cliente.find(@cliente_id)

      @orden_fumigacions = OrdenFumigacion.where(cliente_id:@cliente_id).order("updated_at DESC, nro_ordfumigacion DESC, ltr_of DESC").all

  end

  def proximas_fumigaciones
      
      @date_method = (params[:search].present? ? params[:search][:date_method]: '').to_sym

      @start = selected_date(:start_date)
      @end = selected_date(:end_date)

      vectordate_method=@date_method.to_s().split('-')

      if (vectordate_method.length()>2)
        @orden_fumigacions = OrdenFumigacion.none
        puts "en el if -----@date_method : "
        puts @date_method
        puts "en el if -----params[:search] : "
        puts params[:search]
      else
        @orden_fumigacions = params[:search].present? ? OrdenFumigacion.where(@date_method => @start..@end).order("nro_certificado DESC") : OrdenFumigacion.none        
        puts "en el else -----@date_method : "
        puts @date_method
        puts "en el else -----params[:search] : "
        puts params[:search]

        respond_to do |format|
          format.html
          format.js
          format.pdf do
              render pdf: "listado_fumigaciones", :template => 'diario/proximas_fumigaciones.pdf.erb',
              encoding: 'utf8',
              orientation: 'Landscape',
              page_size: 'A4',:print_media_type => true
          end
        end
      end      
  end

  def new
    @cliente_id = params[:id]
    @orden_fumigacion = OrdenFumigacion.new
    @orden_fumigacion.cliente_id = @cliente_id
  end

  def show
    # No lo usamos en este modelo
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "certificado-"+@orden_fumigacion.nro_certificado.to_s, :template => 'orden_fumigacions/certificado.pdf.erb',
        encoding: 'utf8',
        orientation: 'Portrait',
        page_size: 'A4',:print_media_type => true
      end
    end
  end

  def create
    
    @orden_fumigacion = OrdenFumigacion.new(orden_fumigacion_params)

    if (@orden_fumigacion.proximo_tratamiento.nil?)
      if (@orden_fumigacion.fecha_vencimiento.present?)
        @orden_fumigacion.proximo_tratamiento = @orden_fumigacion.fecha_vencimiento + 30
      end
    end  

    @orden_fumigacion.update baja: true
    @orden_fumigacion.update anulado: true

    respond_to do |format|
      if @orden_fumigacion.valid?
        puts "-----------------validacion ok: "
        puts @orden_fumigacion.valid?

        if @orden_fumigacion.save!
          format.html { redirect_to orden_fumigacions_path, notice: 'La orden_fumigacion fue exitosamente creada.' }
          format.json { render :show, status: :created, location: @orden_fumigacion }

          @seguimiento = Seguimiento.new
          @seguimiento.usuario = current_user.email
          @seguimiento.controlador = "create"
          @seguimiento.registro_procesado = "OrdenFumigacion : " + orden_fumigacion_params.to_s
          @seguimiento.accion = Time.now.to_s + " "
          @seguimiento.save  
        end  

      else 
        puts "-----------------validacion fail: "
        puts @orden_fumigacion.valid?
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
        
        @seguimiento = Seguimiento.new
        @seguimiento.usuario = current_user.email
        @seguimiento.controlador = "update"
        @seguimiento.registro_procesado = "OrdenFumigacion : " + orden_fumigacion_params.to_s
        @seguimiento.accion = Time.now.to_s + " "
        @seguimiento.save

      else
        render :edit
      end
  end

  def anular
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    @orden_fumigacion.update anulado: false

    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "anular"
    @seguimiento.registro_procesado = "OrdenFumigacion : " + @orden_fumigacion.id.to_s
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save

    respond_to do |format|
      format.html { redirect_to orden_fumigacions_fumigaciones_por_cliente_url(:id => @orden_fumigacion.cliente.id), notice: 'La orden_fumigacion fue anulada.' }
      format.json { head :no_content }
    end
  end

  # Aparentemente el delete es mejor que destroy ya que ejecuta una consulta sql directa
  def delete
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    @orden_fumigacion.update baja: false

    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "delete"
    @seguimiento.registro_procesado = "OrdenFumigacion : " + @orden_fumigacion.id.to_s
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save

    respond_to do |format|
      format.html { redirect_to orden_fumigacions_url, notice: 'La orden_fumigacion fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_fumigacion
      @orden_fumigacion = OrdenFumigacion.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def orden_fumigacion_params
      params.require(:orden_fumigacion).permit(:cliente_id, :tecnico_id, :nro_ordfumigacion, :nro_certificado, :tipo_certificado, :fecha_aplicacion, :hora_aplicacion, :tratamiento, :vector, :superficie, :veneno, :droga, :observaciones_ordfumigacion, :fecha_vencimiento, :proximo_tratamiento, :importe, :fecha_refuerzo, :importe_refuerzo, :fecha_repaso, :importe_repaso, :estado, :anulado, :baja)
    end

    def selected_date(symbol)
    params[:search].present? && params[:search][symbol].present? ? params[:search][symbol].to_date : Time.now.to_date
    end
end
