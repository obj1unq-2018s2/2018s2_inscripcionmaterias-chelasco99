import universidad.*
import materias.*
	
class Carrera {
	var property materias = []
	
	method materiasConAnio(anioQuePertenece) {
		return materias.filter { materia => materia.anioQuePertenece() == anioQuePertenece}
	}
}	

