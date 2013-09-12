# == Schema Information
#
# Table name: materias
#
#  id           :integer          not null, primary key
#  code 		:string(255)
#  name 		:string(255)
#  created_at   :datetime         not null
#

class Materia < ActiveRecord::Base
  attr_accessible :code, :name
end
