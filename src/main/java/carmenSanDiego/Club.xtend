package carmenSanDiego

import java.util.Random

class Club extends Lugar{
	
	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		var String pista = this.obtenerPistaVillanoSenaParticular(villano) + " " + this.obtenerPistaVillanoSenaParticular(villano) + " "
		// el 70% de las veces agrega una pista sobre los hobbies del villano
		if( new Random().nextInt(9) >= 3) pista + this.obtenerPistaVillanoHobbies(villano)
		pista
	}
	
}