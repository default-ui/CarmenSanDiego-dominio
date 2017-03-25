package carmenSanDiego

import java.util.Random

class Biblioteca extends Lugar {

	new() {
		nombre = "Library"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		var String pista = this.obtenerPistaPais(siguienteDestino) + " " +
						   this.obtenerPistaVillanoSenaParticular(villano) + " "
		// hay 50% de probabilidad de sacar una pista sobre los hobbies del villano
		if(new Random().nextInt(1) > 0) pista + this.obtenerPistaVillanoHobbies(villano)
		pista
	}

	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
