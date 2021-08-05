class AddUsuarioFinalizaToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :usuario_finaliza, :string
  end
end
