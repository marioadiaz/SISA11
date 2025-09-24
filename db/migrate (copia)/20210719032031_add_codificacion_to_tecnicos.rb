class AddCodificacionToTecnicos < ActiveRecord::Migration[6.1]
  def change
    add_column :tecnicos, :codificacion, :string
  end
end
