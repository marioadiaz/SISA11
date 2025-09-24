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

  def self.search(hashcadena)
      
    if hashcadena.nil? 
      
      where('id <> ?',0)
    else
      
      nro_certificado = ApplicationController.helpers.procesarelemento(hashcadena["nro_certificado"])
      cli_nombre = ApplicationController.helpers.procesarelemento(hashcadena["cli_nombre"])
      cli_apellido = ApplicationController.helpers.procesarelemento(hashcadena["cli_apellido"])
      cli_rubro = ApplicationController.helpers.procesarelemento(hashcadena["cli_rubro"])
      tec_codificacion = ApplicationController.helpers.procesarelemento(hashcadena["tec_codificacion"])
      tec_apellido = ApplicationController.helpers.procesarelemento(hashcadena["tec_apellido"])
      importe = ApplicationController.helpers.procesarelemento(hashcadena["importe"])

      orden_fumigacions = OrdenFumigacion.joins(:cliente, :tecnico)

      orden_fumigacions = orden_fumigacions.where(['nro_certificado LIKE ?', "%#{nro_certificado.upcase}%"])       if nro_certificado.present?
      orden_fumigacions = orden_fumigacions.where(['clientes.nombre like ?',"%#{cli_nombre.upcase}%"])             if cli_nombre.present?
      orden_fumigacions = orden_fumigacions.where(['clientes.apellido like ?',"%#{cli_apellido.upcase}%"])         if cli_apellido.present?
      orden_fumigacions = orden_fumigacions.where(['clientes.rubro like ?',"%#{cli_rubro.upcase}%"])               if cli_rubro.present?
      orden_fumigacions = orden_fumigacions.where(['tecnicos.codificacion like ?',"%#{tec_codificacion.upcase}%"]) if tec_codificacion.present?
      orden_fumigacions = orden_fumigacions.where(['tecnicos.apellido like ?',"%#{tec_apellido.upcase}%"])         if tec_apellido.present?
      orden_fumigacions = orden_fumigacions.where(['importe = ?', "#{importe.upcase}"])                            if importe.present?

      return orden_fumigacions
        end

    end 

end
