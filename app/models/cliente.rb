class Cliente < ApplicationRecord

	has_many :remitos
	
	has_many :orden_fumigacions
	has_many :tecnicos, through: :orden_fumigacions

	#validates :nombre, presence: true
	#validates :apellido, presence: true

	before_create { |cliente| cliente.nombre = cliente.nombre.upcase }
	before_create { |cliente| cliente.apellido = cliente.apellido.upcase }
	before_create { |cliente| cliente.rubro = cliente.rubro.upcase }
	before_create { |cliente| cliente.domicilio = cliente.domicilio.upcase }
	before_create { |cliente| cliente.barrio = cliente.barrio.upcase }
	before_create { |cliente| cliente.localidad = cliente.localidad.upcase }

    TIPO_CLIENTE = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']

    def self.search(hashcadena)
      
 		if hashcadena.nil? 
 			puts "--------nil---------------hashcadena[nombre]: "
        	puts hashcadena
 			where('id <> ?',0)
 		else
 			puts "--------not nil---------------hashcadena[nombre]: "
        	puts hashcadena["nombre"].squeeze(' ').strip

      		nombre = ApplicationController.helpers.procesarelemento(hashcadena["nombre"])
 			apellido = ApplicationController.helpers.procesarelemento(hashcadena["apellido"])
 			rubro = ApplicationController.helpers.procesarelemento(hashcadena["rubro"])
 			domicilio = ApplicationController.helpers.procesarelemento(hashcadena["domicilio"])
 			barrio = ApplicationController.helpers.procesarelemento(hashcadena["barrio"])
 			localidad = ApplicationController.helpers.procesarelemento(hashcadena["localidad"])

 			clientes = Cliente.all

 			clientes = clientes.where(['nombre LIKE ?', "%#{nombre.upcase}%"]) if nombre.present?
 			clientes = clientes.where(['apellido LIKE ?', "%#{apellido.upcase}%"]) if apellido.present?
 			clientes = clientes.where(['rubro LIKE ?', "%#{rubro.upcase}%"]) if rubro.present?
 			clientes = clientes.where(['domicilio LIKE ?', "%#{domicilio.upcase}%"]) if domicilio.present?
 			clientes = clientes.where(['barrio LIKE ?', "%#{barrio.upcase}%"]) if barrio.present?
 			clientes = clientes.where(['localidad LIKE ?', "%#{localidad.upcase}%"]) if localidad.present?

 			return clientes
        end

    end  

end
