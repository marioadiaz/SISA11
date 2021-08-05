class AddClienteConformeToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :cliente_conforme, :boolean
  end
end
