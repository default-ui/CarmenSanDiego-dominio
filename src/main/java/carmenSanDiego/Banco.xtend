package carmenSanDiego

class Banco extends Lugar {

	new() {
		nombre = "Bank"
	}

	override obtenerPistas() {
		"PistaBanco"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) + " " +
					this.obtenerPistaVillanoSenaParticular(villano) + " "
					
		pista
	}

}
