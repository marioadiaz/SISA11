class AddObservacionFinalToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :observacion_final, :string
  end
end
