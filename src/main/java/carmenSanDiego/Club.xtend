package carmenSanDiego

import org.uqbar.commons.utils.Observable

@Observable
class Club extends Lugar{
	
	new() {
		nombre = "Club"
	}
	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaVillanoSenaParticular(villano) + 
					this.obtenerPistaVillanoSenaParticular(villano)
		
		// el 70% de las veces agrega una pista sobre los hobbies del villano
		if( randomGen.nextInt(10) < 7) {
			pista = pista + this.obtenerPistaVillanoHobbie(villano)
		}
		
		pista
	}
	
}