class Queja < ApplicationRecord
  belongs_to :orden_fumigacion

  validates :fecha_queja, presence: true
  validates :codificacion, presence: true
  
  CODIFICACION = ['R1', 'R2', 'R3', 'R4', 'R5', 'R6']
  HASHRECLAMOS = {'R1' => "R1-malo el servicio", 'R2' => "R2-impuntualidad del técnico", 'R3' => "R3-cancelación del servicio por el técnico", 'R4' => "R4-irrespetuoso - mala atención", 'R5' => "R5-falta de informacion administración- técnico", 'R6' => "R6-técnico cansado estresado"}
 

  #R1 - malo el servicio
  #R2 - impuntualidad del técnico
  #R3 - cancelación del servicio por el técnico
  #R4 - irrespetuoso - mala atención
  #R5 - falta de informacion administración- técnico
  #R6 - técnico cansado estresado

end
