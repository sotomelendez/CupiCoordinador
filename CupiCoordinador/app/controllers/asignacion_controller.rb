class AsignacionController < ApplicationController
  def seleccionar
  @materias=Materia.order("nombre ASC").all
  @semestres=Semestre.order("id_sem ASC").all
  end
  
  def resultado
	if Asignacion.count("id_materia=#{params[:asign][:materia]} AND id_semestre=#{params[:asign][:semestre]}")==0
	{
		
	}
	else
	{
		
	}
	render :action => 'ReservarPrograma'
	render :action => 'ReservarOtroPrograma'
	render :action => 'ReserverPregrado'
  end
  
  def ReservarPrograma
  
  end
  
  def ReservarPregrado
  
  end
  
  def ReservarOtroPrograma
  
  end
end
