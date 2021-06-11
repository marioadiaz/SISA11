class Tecnico < ApplicationRecord
	has_many :orden_fumigacions
	has_many :clientes, through: :orden_fumigacions




validates :nombre, presence: true
validates :apellido, presence: true


#validates :dni, presence: true,  uniqueness: true
#validates :domicilio, presence: true
#validates :barrio, presence: true
#validates :celular, presence: true


before_create { |tecnico| tecnico.apellido = tecnico.apellido.upcase }
before_create { |tecnico| tecnico.nombre = tecnico.nombre.upcase }
before_create { |tecnico| tecnico.domicilio = tecnico.domicilio.upcase }
before_create { |tecnico| tecnico.barrio = tecnico.barrio.upcase }





before_update { |tecnico| tecnico.apellido = tecnico.apellido.upcase }
before_update { |tecnico| tecnico.nombre = tecnico.nombre.upcase }
before_update { |tecnico| tecnico.domicilio = tecnico.domicilio.upcase }
before_update { |tecnico| tecnico.barrio = tecnico.barrio.upcase }


	def self.buscador(termino)
      Tecnico.where("apellido LIKE ?", "%#{termino}%")
    end
end
