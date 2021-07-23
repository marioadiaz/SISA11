class DiarioController < ApplicationController
  before_action only: [ :index]
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
