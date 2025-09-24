class ChangeTipoClienteinclientes < ActiveRecord::Migration[6.1]
  def change
  		change_column :clientes, :tipo_cliente, :string 
	
  end
end
