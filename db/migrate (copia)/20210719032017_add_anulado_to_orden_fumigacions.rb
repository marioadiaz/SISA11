class AddAnuladoToOrdenFumigacions < ActiveRecord::Migration[6.1]
  def change
    add_column :orden_fumigacions, :anulado, :boolean
  end
end
