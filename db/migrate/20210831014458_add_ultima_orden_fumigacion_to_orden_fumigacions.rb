class AddUltimaOrdenFumigacionToOrdenFumigacions < ActiveRecord::Migration[6.1]
  def change
    add_column :orden_fumigacions, :ultima_ordfumigacion, :boolean
  end
end
