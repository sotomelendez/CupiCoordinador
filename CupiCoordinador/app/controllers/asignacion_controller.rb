class AsignacionController < ApplicationController
  def seleccionar
  @materias=Materia.order("nombre ASC").all
  @semestres=Semestre.order("id_sem ASC").all
  end
  
  def resultado
	if Asignacion.count("id_materia=#{params[:asign][:materia]} AND id_semestre=#{params[:asign][:semestre]}")==0
	{
		render :action => 'ReservarPrograma'
		render :action => 'ReservarOtroPrograma'
		render :action => 'ReserverPregrado'
	}
	
  end
  
  def ReservarPrograma
	@estuds = Estudiante.select("id, name").joins("join estudiante_materia_periodos on estudiantes.id=estudiante_materia_periodos.id_estudiante").where("estudiante_materia_periodos.id_materia=#{params[:asign][:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:asign][:semestre]}").order("random()").limit(10)
	@estuds.each do |est|
		@asignado = Asignacion.new(params[:asign][:materia],est.id,params[:asign][:semestre])
		@asignado.save
	end
  end
  
  def ReservarPregrado
  
  end
  
  def ReservarOtroPrograma
  
  end
end
