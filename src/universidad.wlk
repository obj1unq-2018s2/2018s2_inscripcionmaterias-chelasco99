class Estudiante {
	var property carreras = []
	var property materiasAprobadas = []
	var property cantidadDeCreditos = 0

   method puedeCursarMateria(materia) { return 
      self.esDeSuCarrera(materia) and not self.aprobo(materia) and not self.estaIncripto(materia) and materia.prerrequisitos(self)
   }
   
   method esDeSuCarrera(materia) {
   	 return carreras.contains(materia.carrera())
   }
   
   method aprobo(materia) {
   	return materiasAprobadas.contains(materia)
   }
   
   method estaIncripto(materia) {
   	 return materia.curso().contains(self)
   }
   
}	
	