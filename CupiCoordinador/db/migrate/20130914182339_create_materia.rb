class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      
      t.string :idu
      t.string :nombre

   
    end
  end
end
