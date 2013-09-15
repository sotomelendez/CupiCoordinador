class CoordinadorController < ApplicationController

def consolidado
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@resultado=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").group("id_estudiante")
end

def show_materia
@semestres=Semestre.order("id_sem ASC").all
@porMateria=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia='#{params[:materia]}'").group("id_estudiante")
end

end
