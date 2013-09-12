# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  year 		:integer
#  sem	 		:integer
#  created_at   :datetime         not null
#

class Materia < ActiveRecord::Base
  attr_accessible :year, :sem

  # ============
  # Associations
  # ============
  has_many :materias
end