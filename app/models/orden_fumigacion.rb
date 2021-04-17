class OrdenFumigacion < ApplicationRecord
  belongs_to :cliente
  belongs_to :tecnico
  has_many :quejas

  TRATAMIENTO =  ["Aspersión","Humo","Niebla","Otros"]
  VECTOR =  ["Insectos","Roedores","Voladores","Bacterias","Otros"]
  VENENO = ["C", "B", "A"]
  DROGA = ["Piretroydes", "Bromadilone", "Otros"]
  ESTADO = ["En proceso", "Finalizado"]

end
