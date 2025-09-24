class CreateQuejas < ActiveRecord::Migration[6.1]
  def change
    create_table :quejas do |t|
      t.references :orden_fumigacion, null: false, foreign_key: true
      t.integer :nro_queja
      t.date :fecha_queja
      t.string :observaciones_queja
      t.string :estado
      t.boolean :baja

      t.timestamps
    end
  end
end
