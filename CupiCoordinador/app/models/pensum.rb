# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  stud_id 		:string(255)
#  name 		:string(255)
#  created_at   :datetime         not null
#

class Pensum < ActiveRecord::Base
  #attr_accessible

  # ============
  # Associations
  # ============
  belongs_to :estudiante
  has_many :semestres
end