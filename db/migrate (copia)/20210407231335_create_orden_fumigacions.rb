class CreateOrdenFumigacions < ActiveRecord::Migration[6.1]
  def change
    create_table :orden_fumigacions do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :tecnico, null: false, foreign_key: true
      t.integer :nro_ordfumigacion
      t.integer :nro_certificado
      t.string :tipo_certificado
      t.date :fecha_aplicacion
      t.time :hora_aplicacion
      t.string :tratamiento
      t.string :vector
      t.string :superficie
      t.string :veneno
      t.string :droga
      t.string :observaciones_ordfumigacion
      t.date :fecha_vencimiento
      t.date :proximo_tratamiento
      t.integer :importe
      t.string :estado
      t.boolean :baja

      t.timestamps
    end
  end
end
