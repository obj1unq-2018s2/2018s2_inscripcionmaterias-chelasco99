import universidad.*
	
class Materia {
	var property materiasCorrelativas = []
	var property carrera
	var property curso
	var property creditos = 0
	var property anio = 0
	
	method prerrequisitos(estudiante) = true	
}


class MateriaCorrelativa inherits Materia {
	override method prerrequisitos(estudiante) {
		return estudiante.materiasAprobadas().contains(materiasCorrelativas)
	}
}

class MateriaConCreditos inherits Materia {
	override method prerrequisitos(estudiante) {
		return estudiante.cantidadDeCreditos() >= self.creditos()
	}
}	

class MateriaPorAnio inherits Materia {
	override method prerrequisitos(estudiante) {
		return estudiante.materiasAprobadas().contains(carrera.materiasDeAnio(anio - 1))		
	}
}

class MateriaSinPrerrequisitos inherits Materia {
	override method prerrequisitos(estudiante) = true
}