class Queja < ApplicationRecord
  belongs_to :orden_fumigacion

  validates :fecha_queja, presence: true
  
end
