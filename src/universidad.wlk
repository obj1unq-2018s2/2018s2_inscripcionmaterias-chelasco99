class Estudiante {
	var property carrera = []
	var property materiasAprobadas = []
	var property cantidadDeCreditos = 0
	
	method puedeCursarMateria(unaMateria) {
		return not self.aproboMateria(unaMateria) and unaMateria.cumpleConLosRequisitos() 		
	}
	
	method aproboMateria(unaMateria) {
		return materiasAprobadas.any { materia => materia == unaMateria }
	}
	
	method correspondeACarrera(unaMateria) {				
	} 
	
	method registrarMateriaAprobada(unaMateria) {
		return materiasAprobadas + unaMateria
		
	}
}


class EstudianteAproboMateriaConNota {
	var property materia
	var property nota = 0
}