class QuejasController < ApplicationController
  def index
      @quejas = Queja.all.order(:nro_queja)
      respond_to do |format|
      format.html
      format.json
      format.pdf do
      render template: 'quejas/pdf', pdf: 'Reporte'
      end
    end
  end

  def new
    @queja = Queja.new
  end

  def show
    # No lo usamos en este modelo
  end

  def create
    @queja = Queja.new(queja_params)

    @queja.update baja: true

    respond_to do |format|
      if @queja.save
        format.html { redirect_to quejas_path, notice: 'La queja fue exitosamente creada.' }
        format.json { render :show, status: :created, location: @queja }
      else
        format.html { render :new }
        format.json { render json: @queja.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @queja = Queja.find(params[:id])
  end

  def update
        @queja = Queja.find(params[:id])
      if @queja.update(queja_params)
        redirect_to quejas_path
      else
        render :edit
      end
  end

  # Aparentemente el delete es mejor que destroy ya qye ejecuta una consulta sql directa
  def delete
    @queja = Queja.find(params[:id])
    @queja.update baja: false
    respond_to do |format|
      format.html { redirect_to quejas_url, notice: 'La queja fue eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queja
      @queja = Queja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def queja_params
      params.require(:queja).permit(:orden_fumigacion_id, :nro_queja, :fecha_queja, :observaciones_queja, :estado, :baja)
    end
end
