class SeguimientosController < ApplicationController
  before_action :set_seguimiento, only: [:show, :edit, :update, :delete]

  def index
    @seguimientos = Seguimiento.all.order(:usuario)
  end

  def new
    @seguimiento = Seguimiento.new
  end

  def show
  end

  def create
    @seguimiento = Seguimiento.new(seguimiento_params)
  end

  def edit
    @seguimiento = Seguimiento.find(params[:id])
  end

  def update
    @seguimiento = Seguimiento.find(params[:id])
      if @seguimiento.update(seguimiento_params)
        
      else
        render :edit
      end
  end

  def delete
    @seguimiento = Seguimiento.find(params[:id])

    @seguimiento.update baja: false

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def seguimiento_params
      @seguimiento = Seguimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seguimiento_params
      params.require(:seguimiento).permit(:usuario, :controlador, :registro_procesado, :accion, :baja)
    end
end
