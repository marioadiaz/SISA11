class AddRevisadoToQueja < ActiveRecord::Migration[6.1]
  def change
    add_column :quejas, :revisado_gerencia, :boolean
  end
end
