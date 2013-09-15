class CreateEstudianteMateriaPeriodos < ActiveRecord::Migration
  def change
    create_table :estudiante_materia_periodos, :id => false do  |t|
      t.integer :estudiante_id
      t.integer :materia_id
      t.integer :semestre_id

    
    end
  end
end
