# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  stud_id 		:string(255)
#  name 		:string(255)
#  created_at   :datetime         not null
#

class Estudiante < ActiveRecord::Base
  attr_accessible :stud_id, :name

  # ============
  # Associations
  # ============
  has_many :estudiante_materia_periodos, :dependent => :destroy
has_many :materias, :through => :estudiante_materia_periodos
has_many :semestres, :through => :estudiante_materia_periodos
  
end
