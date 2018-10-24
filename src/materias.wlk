import universidad.*
	
class Materia {
	var property materiasCorrelativas = []
	var property carreraALaQuePertenece 
	var property curso
	var property creditos = 0
	var property anioQuePertenece = 0
	var property listaDeEspera = 0
	
	method tieneAprobadoLasCorrelativas(estudiante) {
		return materiasCorrelativas.all { materias => estudiante.materiasAprobadas()}
	}
	
	method tieneCreditosSuficientes(estudiante) {
		return estudiante.cantidadDeCreditos() >= self.creditos()
	}
	
	method aproboMateriasDelAnioAnterior(estudiante) {
		return carreraALaQuePertenece.materiasConAnio(anioQuePertenece - 1)
	}  
	
	method noTieneRequisito() {}
	
	
	method cumpleConLosRequisitos()	
	
}	


class MateriasCorrelativas inherits Materia {
	override method cumpleConLosRequisitos() {	
		return self.tieneAprobadoLasCorrelativas(self)	
	}
}

class MateriasConCreditos inherits Materia {
	override method cumpleConLosRequisitos() {
		return self.tieneCreditosSuficientes(self)		
	}
}

class MateriasPorAnio inherits Materia {
	override method cumpleConLosRequisitos() {	
		return self.aproboMateriasDelAnioAnterior(self)	
	}
}

class MateriasSinRequerimiento inherits Materia {
	override method noTieneRequisito() {} 	
}
