class ChangeTypeEstadoToNote < ActiveRecord::Migration[6.1]
  def up
    change_table :notes do |t|
      t.change :estado, :string
    end
  end

  def down
    change_table :notes do |t|
      t.change :estado, :boolean
    end
  end
end
