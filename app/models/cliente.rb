class Cliente < ApplicationRecord
	
	has_many :orden_fumigacions
	has_many :remitos
	has_many :tecnicos, through: :orden_fumigacions

	#validates :nombre, presence: true
	#validates :apellido, presence: true

	before_create { |cliente| cliente.apellido = cliente.apellido.upcase }
	before_create { |cliente| cliente.nombre = cliente.nombre.upcase }
	before_create { |cliente| cliente.rubro = cliente.rubro.upcase }
	before_create { |cliente| cliente.domicilio = cliente.domicilio.upcase }

	before_update { |cliente| cliente.apellido = cliente.apellido.upcase }
	before_update { |cliente| cliente.nombre = cliente.nombre.upcase }
	before_update{ |cliente| cliente.rubro = cliente.rubro.upcase }
	before_update { |cliente| cliente.domicilio = cliente.domicilio.upcase }

    TIPO_CLIENTE = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']

    MUNICIPIO = ['AGAURAY', 'CAFAYATE', 'CERRILLOS', 'COLONIA SANTA ROSA', 'EMBARCACION', 'GENERAL GÜEMES','GENERAL MOSCONI','HIPOLITO YRIGOYEN','JOAQUIN V. GONZÁLEZ','LA MERCED','PICHANAL','SALVADOR MAZZA','ROSARIO DE LA FRONTERA','ROSARIO DE LERMA','SALTA','METÁN','SAN LORENZO','ORÁN','SANTIA VICTORIA ESTE','TARTAGAL']

    MUNICIPIO_NN = ['AGUAS BLANCAS','ANGASTACO','ANIMANÁ','APLINARIO SARAVIA','CACHI','CAMPO QUIJANO','CAMPO SANTO','CHICONANA','CORONEL MOLDES','EL BORDO','CARRIL','GALPÓN','JARDÌN','POTRERO','QUEBRACHAL','TALA','BALLIVIÁN','GENERAL PIZARRO','IRUYA','ISLA DE CAÑAS','LA CALDERA','LA CANDELARIA','LA POMA','LA VIÑA','LAS LAJITAS','LOS TOLDOS','MOLINOS','NAZARENO','PAYOGASTA','RIO PIEDRAS','RIVADAVIA BANDA NORTE','RIVADAVIA BANDA SUR','SAN ANTONIO DE LOS COBRES','SAN CARLOS','SANTA VICTORIA OESTE','SECLANTÀS','TOLAR GRANDE','URUNDEL','VAQUEROS']

    def self.search(cadena)
    	if cadena 
    		search = cadena.upcase
	        where('cuit LIKE ? or nombre LIKE ? or apellido LIKE ? or rubro LIKE ? or domicilio LIKE ? or barrio LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	    else
	    	
	      where('id <> ?',0)

	    end
  	end
end
