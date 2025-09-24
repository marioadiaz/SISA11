class AddUsuarioIniciaToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :usuario_inicia, :string
  end
end
