import universidad.*
import materias.*
	
class Carrera {
	var property materias = []
    
    method materiasDeAnio(anio) {
    	return materias.filter { materia => materia.anio() == anio }
    }
    
    method materiasQueSePuedeInscribir(estudiante) {
    	if ( self.estudiaLaCarrera(estudiante) ) {
    		// TODO Falta el return
    		self.materias().filter { materia => materia.puedeCursarMateria(materia) }
    		
    	}
    	
    	// TODO Este método es una pregunta, no puede no tener un else el if.
    }
    
    method materiasQueEstaInscripto(estudiante) {
    	return self.materias().filter { materia => estudiante.estaIncripto(materia) }
    }
    
    method materiasEnListaDeEspera(estudiante) {
    	// TODO Falla lógica, debería recorrer self.materias()
       return self.materiasQueEstaInscripto(estudiante).filter { materia => estudiante.quedoEnListaDeEspera(materia) }
    }
    
    method estudiaLaCarrera(estudiante) {
    	// TODO Más fácil contains
    	return estudiante.carreras().any { carrera => carrera == self }
    }
}	

