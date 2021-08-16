class PagesController < ApplicationController
 before_action :authenticate_user!

  def home
    @orden_fumigacions = OrdenFumigacion.all.order(:nro_ordfumigacion)
    
    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "home"
    @seguimiento.registro_procesado = "OrdenFumigacion : all"
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save


  end
end
