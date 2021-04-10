class Tecnico < ApplicationRecord
	has_many :orden_fumigacions
	has_many :clientes, through: :orden_fumigacions

	def self.buscador(termino)
      Tecnico.where("apellido LIKE ?", "%#{termino}%")
    end  
end
