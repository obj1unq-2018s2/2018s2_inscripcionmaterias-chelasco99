class Estudiante {
	var property carreras = []
	var property materiasAprobadas = []
	var property cantidadDeCreditos = 0

   method puedeCursarMateria(materia) { return 
      self.esDeLaCarrera(materia) and not self.aprobo(materia) and not self.estaIncripto(materia) and materia.prerrequisitos(self)
   }
   
   method esDeLaCarrera(materia) {
   	// TODO Más fácil carreras.contains(materia.carrera())
   	 return carreras.any { carrera => carrera ==  materia.carrera() }
   }
   
   method aprobo(materia) { // TODO Acá confundis materia con materiaAprobada
   	return materiasAprobadas.contains(materia)
   }
   
   // TODO La materia tiene la información para contestar esta pregunta, mejor sería que el método esté allá.
   method estaIncripto(materia) {
   	 return materia.curso().contains(self)
   }
   
   method aproboMateria(materiaAprobada) {
  	 return materiasAprobadas.add(materiaAprobada).asSet()
  }
  
   // TODO La materia tiene la información para contestar esta pregunta, mejor sería que el método esté allá.
   method quedoEnListaDeEspera(materia) {
  	 return materia.listaDeEspera().contains(self)
  }
  
  method promedio() {
  	return materiasAprobadas.sum { materia => materia.nota() } / materiasAprobadas.size()
  }
}

