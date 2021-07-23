class FajasController < ApplicationController
before_action :set_orden_fumigacion, only: [ :show]

  def index
    @orden_fumigacions = OrdenFumigacion.all.order("nro_certificado DESC")
    respond_to do |format|
      format.html
      format.js
      format.pdf do
          render pdf: "file_name", :template => 'orden_fumigacions/listado_fumigaciones.pdf.erb',
          encoding: 'utf8',
          orientation: 'Landscape',
          page_size: 'A4',:print_media_type => true
      end
    end

  end

  def show
    # No lo usamos en este modelo
    @orden_fumigacion = OrdenFumigacion.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render pdf: "faja-"+@orden_fumigacion.nro_certificado.to_s, :template => 'fajas/faja.pdf.erb', 
        encoding: 'utf8',
        orientation: 'Landscape', 
        page_size: 'A4', :print_media_type => true
        puts "---------------------@orden_fumigacion.nro_certificado: "
        puts @orden_fumigacion.nro_certificado
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
end