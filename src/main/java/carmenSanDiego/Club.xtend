package carmenSanDiego

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
class Club extends Lugar{
	@Accessors Boolean seEncuentraVillano = false
	@Accessors String nombre = "Club"
	new() {
	
		
	}
	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		var pistas = obtenerPistasVillanoSenaParticular(villano)
		var pista = pistas.get(0) + pistas.get(1)
		
		// el 70% de las veces agrega una pista sobre los hobbies del villano
		if( randomGen.nextInt(10) < 7) {
			pista = pista + this.obtenerPistaVillanoHobbie(villano)
		}
		
		pista
	}
	
}