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
		var pista1 = obtenerPistaVillanoSenaParticular(villano)
		var pista2 = obtenerPistaVillanoSenaParticular(villano)
		while (pista2==pista1){
			pista2 = obtenerPistaVillanoSenaParticular(villano)
		}
		var pista = pista1 + pista2
		// el 70% de las veces agrega una pista sobre los hobbies del villano
		if( randomGen.nextInt(10) < 7) {
			pista = pista + this.obtenerPistaVillanoHobbie(villano)
		}
		
		pista
	}
	
}