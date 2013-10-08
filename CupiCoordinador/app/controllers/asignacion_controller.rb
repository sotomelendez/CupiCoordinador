class AsignacionController < ApplicationController
  def seleccionar
  @materias=Materia.order("nombre ASC").all
  @semestres=Semestre.order("id_sem ASC").all
  end
  
  def resultado
    @materia=Materia.find(params[:asign][:materia])
	@semestre=Semestre.find(params[:asign][:semestre_id])
	if Asignacion.count("id_materia=#{params[:asign][:materia]} AND id_semestre=#{params[:asign][:semestre_id]}")==0
		render :action => 'ReservarPrograma' and return
		render :action => 'ReservarOtroPrograma' and return
		render :action => 'ReserverPregrado'
	end
	@resultado = Asignacion.select("estudiantes.name as name, estudiantes,id.stud_id as stud_id, maestria.nombre as maest, semestres.id_sem as sem, materia.idu as idu, materia.nombre as nom_materia").joins("join estudiantes on asignacions.id_estudiante=estudiantes.id").joins("join materia on asignacions.id_materia=materia.id").joins("join semestres on asignacions.id_semestre=semestres.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").join("maestria on estudia.id_maestria=maestria.id").where("id_materia=#{params[:asign][:materia]} AND id_semestre=#{params[:asign][:semestre_id]}").order("cod_maest")
  end
  
  def ReservarPrograma
	@estuds = Estudiante.select("id, name").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join materia_maestria on estudia.id_maestria=materia_maestria.id_maestria").joins("join estudiante_materia_periodos on estudiantes.id=estudiante_materia_periodos.id_estudiante").where("estudiante_materia_periodos.id_materia=#{params[:asign][:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:asign][:semestre_id]} AND estudia.id_maestria=materia_maestria.id_maestria").order("random()").limit(10)
	@estuds.each do |est|
		@asignado = Asignacion.new(params[:asign][:materia],est.id,params[:asign][:semestre])
		@asignado.save
	end
  end
  
  def ReservarPregrado
	@estuds = Estudiante.select("id, name").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join materia_maestria on estudia.id_maestria=materia_maestria.id_maestria").joins("join estudiante_materia_periodos on estudiantes.id=estudiante_materia_periodos.id_estudiante").where("estudiante_materia_periodos.id_materia=#{params[:asign][:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:asign][:semestre_id]} AND estudia.id_maestria=1").order("random()").limit(4)
	@estuds.each do |est|
		@asignado = Asignacion.new(params[:asign][:materia],est.id,params[:asign][:semestre])
		@asignado.save
	end
  end
  
  def ReservarOtroPrograma
	@estuds = Estudiante.select("id, name").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join materia_maestria on estudia.id_maestria=materia_maestria.id_maestria").joins("join estudiante_materia_periodos on estudiantes.id=estudiante_materia_periodos.id_estudiante").where("estudiante_materia_periodos.id_materia=#{params[:asign][:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:asign][:semestre]} AND estudia.id_maestria<>materia_maestria.id_maestria AND estudia.id_maestria<>1").order("random()").limit(6)
	@estuds.each do |est|
		@asignado = Asignacion.new(params[:asign][:materia],est.id,params[:asign][:semestre])
		@asignado.save
	end
  end
end
