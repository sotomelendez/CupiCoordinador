class CreatePensum < ActiveRecord::Migration
  def change
    create_table :pensums do |t|
      t.string :stud_id
      t.string :name

      
    end
  end
end
