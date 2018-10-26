import universidad.*
	
class Materia {
	var property carrera
	var property curso
	var property cupo
	var property listaDeEspera
	
	
	method prerrequisitos(estudiante) = true

	
	method inscribirAlumnoACurso(estudiante) {
  	     if ( estudiante.puedeCursarMateria(self) ) {	
  	   	      if ( cupo > curso.size() ) {
  	   	   	          curso.add(estudiante) 	   	   	   
  	     	} else { 
  	     		 listaDeEspera.add(estudiante)
  	     	     }
  	     	 }   
  	    else { self.error ("No puede cursar la materia") } 	   
  	   	   	
  	   	   }
  	   	   
  	method darDeBaja(estudiante) {
  		curso.remove(estudiante)
  		   if ( not listaDeEspera.isEmpty()) {
  		   	 curso.add(listaDeEspera.first())
  		   	 listaDeEspera.remove(listaDeEspera.first())
  		   }
  	} 
  	
  	method estudiantesInscriptosDeUnaMateria() {
  		return self.curso()  		
  	}
  	
  	method estudiantesEnListaDeEspera() {
  		return self.listaDeEspera()
  	}   	   
}



class MateriaCorrelativa inherits Materia {
	var property materiasCorrelativas = []
	override method prerrequisitos(estudiante) {
		return materiasCorrelativas.all { materia => estudiante.materiasAprobadas().contains(materia) }
	}
}

class MateriaConCreditos inherits Materia {
	var property creditos = 0
	override method prerrequisitos(estudiante) {
		return estudiante.cantidadDeCreditos() >= self.creditos()
	}
}	

class MateriaPorAnio inherits Materia {
	var property anio = 0
	override method prerrequisitos(estudiante) {
		return estudiante.materiasAprobadas().contains(carrera.materiasDeAnio(anio - 1))		
	}
}

class MateriaSinPrerrequisitos inherits Materia {
	override method prerrequisitos(estudiante) = true
}

class MateriaAprobada inherits Materia {
	var property materia
	var property nota
   
}

class MateriaPorOrdenDeLlegada inherits Materia {
	method agregarAListaDeEspera(estudiante) {
		 	if ( cupo < curso.size() ) {
		 		listaDeEspera.add(estudiante)
		 	} 
		 			 
		 }		
	}


	
	