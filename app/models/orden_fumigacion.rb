class OrdenFumigacion < ApplicationRecord
  belongs_to :cliente
  belongs_to :tecnico
  has_many :quejas
end
