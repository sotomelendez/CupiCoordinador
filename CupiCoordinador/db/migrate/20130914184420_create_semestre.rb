class CreateSemestre < ActiveRecord::Migration
  def change
    create_table :semestres do |t|
       t.string :sem_id
      
    end
  end
end
