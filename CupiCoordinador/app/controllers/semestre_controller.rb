class SemestreController < ApplicationController

def new
@estud=Estudiante.all.where(:stud_id => params[:semestre][:cod_stud]).limit(1)
@estud.each do |est|
@id_estudiante=est.id
end
@registro=EstudianteMateriaPeriodo.new(:id_estudiante=>@id_estudiante, :id_materia=>params[:semestre][:materia],:id_semestre=>params[:semestre][:semestre_id])
@registro.save
end

def show

end

end
