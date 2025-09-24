class CreateSeguimientos < ActiveRecord::Migration[6.1]
  def change
    create_table :seguimientos do |t|
      t.string :usuario
      t.string :controlador
      t.string :registro_procesado
      t.string :accion
      t.boolean :baja

      t.timestamps
    end
  end
end
