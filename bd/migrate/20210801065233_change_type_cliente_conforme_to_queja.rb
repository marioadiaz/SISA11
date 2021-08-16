class ChangeTypeClienteConformeToQueja < ActiveRecord::Migration[6.1]
  def up
    change_table :quejas do |t|
      t.change :cliente_conforme, :string
    end
  end

  def down
    change_table :quejas do |t|
      t.change :cliente_conforme, :boolean
    end
  end
end
