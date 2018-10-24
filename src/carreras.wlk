import universidad.*
import materias.*
	
class Carrera {
	var property materias = []
    
    method materiasDeAnio(anio) {
    	return materias.filter { materia => materia.anio() == anio }
    }
}	

