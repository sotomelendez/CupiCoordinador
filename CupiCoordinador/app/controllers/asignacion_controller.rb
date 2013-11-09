class AsignacionController < ApplicationController
  def seleccionar
  @materias=Materia.order("idu ASC").all
  @semestres=Semestre.order("id_sem ASC").all
  end
  
  def resultado
    @materia=Materia.find(params[:asign][:materia])
	@cupos=Cupos.select("num_cupos").where("id_materia=#{params[:asign][:materia]}")
	@asigna = Asignacion.select("count(*) as cuenta").where("id_materia=#{params[:asign][:materia]}")
	if @asigna.first.cuenta < @cupos.first.num_cupos
		redirect_to :action => 'ReservarPrograma',  :params => { :materia => @materia.id, :cupos => @cupos.first.num_cupos }
	else
		redirect_to :action => 'show',  :params => { :materia => @materia.id }
	end
  end
  
  def ReservarPrograma
	@materia=Materia.find(params[:materia].to_i)
	@maestriadelamateria=Maestria.select("maestria.id as id, codigo").joins("join materia_maestria on maestria.id=materia_maestria.id_maestria").where("id_materia=#{params[:materia].to_i}").first
	@estuds = Estudiante.select("estudiantes.id as id, name, apellidos").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("left outer join semvas on estudiantes.id=semvas.id_estudiante").where("estudia.id_maestria=#{@maestriadelamateria.id}").order("semvas.sem desc").limit((params[:cupos].to_i*0.5).to_i)
	@estuds.each do |est|
		if Asignacion.select("id_estudiante").where("id_estudiante=#{est.id} and id_materia=#{@materia.id}").count==0
			@yalavio = false
			@matvistas = MateriasVistas.select("cod_materia").where("id_estudiante=#{est.id} and cod_materia='#{@materia.idu}'")
			if @matvistas.count>0
				@yalavio=true
			end
			if @yalavio==false
				@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => 3)
				@asignado.save
			end
		end
	end
	redirect_to :action => 'ReservarOtroPrograma',  :params => { :materia => params[:materia], :cupos => params[:cupos] }
  end
  
  def ReservarPregrado
	@estuds = EstudianteMateriaPeriodo.select("estudiantes.id as id, name, apellidos").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiante_materia_periodos.id_estudiante=estudia.id_estudiante").joins("join materia_maestria on estudiante_materia_periodos.id_materia=materia_maestria.id_materia").where("estudiante_materia_periodos.id_materia=#{params[:materia]} AND estudia.id_maestria=1").order("random()").limit((params[:cupos].to_i*0.2).to_i)
	@estuds.each do |est|
		if Asignacion.select("id_estudiante").where("id_estudiante=#{est.id} and id_materia=#{@materia.id}").count==0
			@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => 3)
			@asignado.save
		end
	end
	redirect_to :action => 'show', :params => { :materia => params[:materia] }
  end
  
  def ReservarOtroPrograma
	@estuds = EstudianteMateriaPeriodo.select("estudiantes.id as id, name, apellidos").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiante_materia_periodos.id_estudiante=estudia.id_estudiante").joins("join materia_maestria on estudiante_materia_periodos.id_materia=materia_maestria.id_materia").where("estudiante_materia_periodos.id_materia=#{params[:materia]} AND estudia.id_maestria<>materia_maestria.id_maestria AND estudia.id_maestria<>1").order("random()").limit((params[:cupos].to_i*0.3).to_i)
	@estuds.each do |est|
		if Asignacion.select("id_estudiante").where("id_estudiante=#{est.id} and id_materia=#{@materia.id}").count==0
			@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => 3)
			@asignado.save
		end
	end
	redirect_to :action => 'ReservarPregrado', :params => { :materia => params[:materia], :cupos => params[:cupos] }
  end
  
  def show
	@materia=Materia.find(params[:materia].to_i)
	@resultado = Asignacion.select("estudiantes.name as name, apellidos, estudiantes.stud_id as stud_id, maestria.codigo as cod_maest, maestria.nombre as maest").joins("join estudiantes on asignacions.id_estudiante=estudiantes.id").joins("join estudia on asignacions.id_estudiante=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("asignacions.id_materia=#{params[:materia].to_i}").order("maest, stud_id")
  end
end
