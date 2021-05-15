class CreateRemitos < ActiveRecord::Migration[6.1]
  def change
    create_table :remitos do |t|
      t.references :orden_fumigacion, null: false, foreign_key: true
      t.string :nro_remito
      t.date :fecha_remito
      t.string :concepto
      t.integer :importe
      t.boolean :baja

      t.timestamps
    end
  end
end
