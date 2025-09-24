class ChangeTypeNroCertificadoToOrdenFumigacion < ActiveRecord::Migration[6.1]
  def up
    change_table :orden_fumigacions do |t|
      t.change :nro_certificado, :string
    end
  end

  def down
    change_table :orden_fumigacions do |t|
      t.change :nro_certificado, :integer
    end
  end
end
