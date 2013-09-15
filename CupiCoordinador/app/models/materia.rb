class Materia < ActiveRecord::Base
  
  attr_accessible :ideu, :nombre
  
    has_many :estudiante_materia_periodos, :dependent => :destroy
has_many :estudiantes, :through => :estudiante_materia_periodos
has_many :semestres, :through => :estudiante_materia_periodos
end
