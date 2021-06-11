class OrdenFumigacion < ApplicationRecord
  belongs_to :cliente
  belongs_to :tecnico
  has_many :quejas

validates :nro_certificado, presence: true, uniqueness: true, :numericality => { :greater_than_or_equal_to => 0 }
validates :tipo_certificado, presence: true
validates :fecha_aplicacion, presence: true
validates :tratamiento, presence: true
validates :vector, presence: true
validates :droga, presence: true
validates :fecha_vencimiento, presence: true

before_create { |orden_fumigacion| orden_fumigacion.superficie = orden_fumigacion.superficie.upcase }

TIPO_CERTIFICADO = ["C,F"]
TRATAMIENTO =  ["Aspersión","Humo","Niebla","Otros"]
VECTOR =  ["Insectos","Roedores","Voladores","Bacterias","Otros"]
VENENO = ["C", "B", "A"]
DROGA = ["Piretroydes", "Bromadilone", "Otros"]
ESTADO = ["En proceso", "Finalizado"]

PERIODO = {30 => "Mensual", 60 => "Bimestral", 90 => "Trimestral", 120 => "Cuatrimestral"}

#MESESXDIAS = {1 => 31,2 =>31,}

MESES30 = [4,6,9,11]
end
