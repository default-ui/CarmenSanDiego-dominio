package carmenSanDiego

import java.util.Random

class Biblioteca extends Lugar {

	new() {
		nombre = "Library"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		var String pista = this.obtenerPistaPais(siguienteDestino) + " " +
						   this.obtenerPistaVillanoSenaParticular(villano) + " "
		if(new Random().nextInt(1) > 0) pista + this.obtenerPistaVillanoHobbies(villano)
	}

	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
