class OrdenFumigacion < ApplicationRecord
  belongs_to :cliente
  belongs_to :tecnico
  has_many :quejas

  validates :nro_certificado, presence: true
  validates :hora_aplicacion, presence: true
  validates :fecha_aplicacion, presence: true
  validates :fecha_vencimiento, presence: true
  

  before_create { |orden_fumigacion| orden_fumigacion.superficie = orden_fumigacion.superficie.upcase }

  TIPO_CERTIFICADO = ["C,F"]
  TRATAMIENTO =  ["Aspersión","Humo","Niebla","Otros"]
  VECTOR =  ["Insectos","Roedores","Voladores","Bacterias","Otros"]
  VENENO = ["C"]
  DROGA = ["Piretroydes", "Bromadilone", "Otros"]
  ESTADO = ["En proceso", "Finalizado"]

end
