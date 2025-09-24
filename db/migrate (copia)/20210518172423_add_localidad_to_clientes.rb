class AddLocalidadToClientes < ActiveRecord::Migration[6.1]
  def change
    add_column :clientes, :localidad, :string
  end
end
