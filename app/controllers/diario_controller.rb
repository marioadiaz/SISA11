class DiarioController < ApplicationController
  before_action only: [ :index, :proximas_fumigaciones]
  def index
    @orden_fumigacions = OrdenFumigacion.where("updated_at > ?",Time.now.midnight).all.order("updated_at desc")

    respond_to do |format|
      format.html
      format.js
      format.pdf do
          render pdf: "fumigaciones_hoy", :template => 'diario/listado_fumigaciones_hoy.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end
  end

  def proximas_fumigaciones
      
      @date_method = (params[:search].present? ? params[:search][:date_method]: '').to_sym

      @start = selected_date(:start_date)
      @end = selected_date(:end_date)

      vectordate_method=@date_method.to_s().split('-')

      if (vectordate_method.length()>2)
        @orden_fumigacions = OrdenFumigacion.none
        puts "en el if diario-----@date_method : "
        puts @date_method
      else
        @orden_fumigacions = OrdenFumigacion.where(@date_method => @start..@end)

        respond_to do |format|
          format.html
          format.js
          format.pdf do
              render pdf: "listado_fumigaciones", :template => 'diario/proximas_fumigaciones.pdf.erb',
              encoding: 'utf8',
              orientation: 'Landscape',
              page_size: 'A4',:print_media_type => true
          end
          puts "en el else diario-----@date_method : "
          puts @date_method
        end
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
