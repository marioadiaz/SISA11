class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :usuario_inicia
      t.string :turno
      t.string :fecha_inicio
      t.string :descripcion_novedad
      t.string :usuario_finaliza
      t.string :fecha_finalizacion
      t.boolean :estado
      t.boolean :baja

      t.timestamps
    end
  end
end
