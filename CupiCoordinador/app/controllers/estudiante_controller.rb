class EstudianteController < ApplicationController

def semtent
@materias=Materia.all
@semestres=Semestre.all
end

end
