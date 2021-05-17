class Cliente < ApplicationRecord
	
	has_many :orden_fumigacions
	has_many :remitos
	has_many :tecnicos, through: :orden_fumigacions

	validates :nombre, presence: true
	validates :apellido, presence: true

	before_create { |cliente| cliente.apellido = cliente.apellido.upcase }
	before_create { |cliente| cliente.nombre = cliente.nombre.upcase }
	before_create { |cliente| cliente.rubro = cliente.rubro.upcase }
	before_create { |cliente| cliente.domicilio = cliente.domicilio.upcase }

	before_update { |cliente| cliente.apellido = cliente.apellido.upcase }
	before_update { |cliente| cliente.nombre = cliente.nombre.upcase }
	before_update{ |cliente| cliente.rubro = cliente.rubro.upcase }
	before_update { |cliente| cliente.domicilio = cliente.domicilio.upcase }

    TIPO_CLIENTE = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']

    def self.search(cadena)
    	if cadena 
    		search = cadena.upcase
	        where('cuit LIKE ? or nombre LIKE ? or apellido LIKE ? or rubro LIKE ? or domicilio LIKE ? or barrio LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	    else
	    	
	      where('id <> ?',0)

	    end
  	end
end
