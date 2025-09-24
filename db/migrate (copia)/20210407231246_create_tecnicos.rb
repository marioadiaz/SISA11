class CreateTecnicos < ActiveRecord::Migration[6.1]
  def change
    create_table :tecnicos do |t|
      t.string :dni
      t.string :apellido
      t.string :nombre
      t.string :domicilio
      t.string :barrio
      t.string :celular
      t.string :telefono
      t.string :correo
      t.string :observaciones_tecnico
      t.boolean :baja

      t.timestamps
    end
  end
end
