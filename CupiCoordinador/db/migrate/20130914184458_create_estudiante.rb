class CreateEstudiante < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :stud_id
      t.string :name
    end
  end
end
