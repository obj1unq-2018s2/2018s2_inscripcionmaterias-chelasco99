class Estudiante {
	var property carreras = []
	var property materiasAprobadas = []
	var property cantidadDeCreditos = 0

   method puedeCursarMateria(materia) { return 
      self.esDeLaCarrera(materia) and not self.aprobo(materia) and not self.estaIncripto(materia) and materia.prerrequisitos(self)
   }
   
   method esDeLaCarrera(materia) {
   	 return carreras.any { carrera => carrera ==  materia.carrera() }
   }
   
   method aprobo(materia) {
   	return materiasAprobadas.contains(materia)
   }
   
   method estaIncripto(materia) {
   	 return materia.curso().contains(self)
   }
   
   method aproboMateria(materiaAprobada) {
  	 return materiasAprobadas.add(materiaAprobada).asSet()
  }
  
   method quedoEnListaDeEspera(materia) {
  	 return materia.curso().contains(self)
  }
  
}

