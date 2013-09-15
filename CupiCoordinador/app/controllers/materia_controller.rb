class MateriaController < ApplicationController
  def MostrarMateria
    if   params[:MateriaSeleccionada] != 'Seleccione una materia'
      @materia = materias.Find(params[:MateriaSeleccionada])
    end
  end
  
  def all
	@materias = Materia.all
  end
end
