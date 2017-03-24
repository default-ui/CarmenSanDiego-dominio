package carmenSanDiego

class Banco extends Lugar {

	new() {
		nombre = "Bank"
	}

	override obtenerPistas() {
		"PistaBanco"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		// obtengo un numero random para sacar una caracteristica de la lista de paises y
		// de villanos respectivamente
		this.obtenerPistaPais(siguienteDestino) + " " + this.obtenerPistaVillanoSenaParticular(villano)

	}

}
