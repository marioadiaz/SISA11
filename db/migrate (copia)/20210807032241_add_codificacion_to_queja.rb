class AddCodificacionToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :codificacion, :string
  end
end
