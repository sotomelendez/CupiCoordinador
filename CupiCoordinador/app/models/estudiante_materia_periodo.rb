class EstudianteMateriaPeriodo < ActiveRecord::Base
  
  attr_accessible :estudiante_id, :materia_id, :periodo_id
  
  belongs_to :estudiante  
belongs_to :materia
belongs_to :periodo  

end
