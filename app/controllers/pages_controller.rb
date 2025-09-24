class PagesController < ApplicationController
 before_action :authenticate_user!

  def home
    @orden_fumigacions = OrdenFumigacion.where(['fecha_vencimiento >= ?',Date.today]).order("fecha_vencimiento ASC").paginate(:page => params[:page], :per_page => 30 )
    
    @seguimiento = Seguimiento.new
    @seguimiento.usuario = current_user.email
    @seguimiento.controlador = "home"
    @seguimiento.registro_procesado = "OrdenFumigacion : all"
    @seguimiento.accion = Time.now.to_s + " "
    @seguimiento.save

  end
end
