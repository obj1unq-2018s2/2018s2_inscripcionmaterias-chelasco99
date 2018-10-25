import universidad.*
import materias.*
	
class Carrera {
	var property materias = []
    
    method materiasDeAnio(anio) {
    	return materias.filter { materia => materia.anio() == anio }
    }
    
    method materiasQueSePuedeInscribir(estudiante) {
    	if ( self.estudiaLaCarrera(estudiante) ) {
    		self.materias().filter { materia => materia.puedeCursarMateria(materia) }
    		
    	}
    }
    
    method materiasQueEstaInscripto(estudiante) {
    	return self.materias().filter { materia => estudiante.estaIncripto(materia) }
    }
    
    method materiasEnListaDeEspera(estudiante) {
       return self.materiasQueEstaInscripto(estudiante).filter { materia => estudiante.quedoEnListaDeEspera(materia) }
    }
    
    method estudiaLaCarrera(estudiante) {
    	return estudiante.carreras().any { carrera => carrera == self }
    }
}	

