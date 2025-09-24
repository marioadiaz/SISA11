class AddFechaFinalizacionToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :fecha_finalizacion, :date
  end
end
