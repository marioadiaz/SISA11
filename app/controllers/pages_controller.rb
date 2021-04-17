class PagesController < ApplicationController
 before_action :authenticate_user!

  def home
    @orden_fumigacions = OrdenFumigacion.all.order(:nro_ordfumigacion)
  end
end
