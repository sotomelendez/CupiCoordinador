# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  year 		:integer
#  sem	 		:integer
#  created_at   :datetime         not null
#

class Semestre < ActiveRecord::Base
  attr_accessible :year, :sem

  # ============
  # Associations
  # ============
  has_many :estudiante_materia_periodos, :dependent => :destroy
has_many :estudiantes, :through => :estudiante_materia_periodos
has_many :materias, :through => :estudiante_materia_periodos
end