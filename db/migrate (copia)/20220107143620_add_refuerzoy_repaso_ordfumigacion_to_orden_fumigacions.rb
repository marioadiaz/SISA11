class AddRefuerzoyRepasoOrdfumigacionToOrdenFumigacions < ActiveRecord::Migration[6.1]
  def change
    add_column :orden_fumigacions, :fecha_refuerzo, :date
    add_column :orden_fumigacions, :importe_refuerzo, :integer
    add_column :orden_fumigacions, :fecha_repaso, :date
    add_column :orden_fumigacions, :importe_repaso, :integer
  end
end
