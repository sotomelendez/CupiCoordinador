# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  stud_id 		:string(255)
#  name 		:string(255)
#  created_at   :datetime         not null
#

class Materia < ActiveRecord::Base
  attr_accessible :stud_id, :name

  # ============
  # Associations
  # ============
  has_many :semestres
  has_one :pensum
end
