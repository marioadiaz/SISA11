class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :cuit
      t.string :rubro
      t.string :apellido
      t.string :nombre
      t.string :domicilio
      t.string :barrio
      t.string :celular
      t.string :telefono
      t.string :correo
      t.string :observaciones_cliente
      t.integer :tipo_cliente
      t.integer :calificacion
      t.boolean :baja

      t.timestamps
    end
  end
end
