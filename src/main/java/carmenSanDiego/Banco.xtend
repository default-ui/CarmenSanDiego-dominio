package carmenSanDiego

class Banco extends Lugar {

	new() {
		nombre = "Bank"
	}

	override obtenerPistas() {
		"PistaBanco"
	}

	override obtenerPista(Pais pais, Villano villano, Pais destino) {
		// obtengo un numero random para sacar una caracteristica de la lista de paises y
		// de villanos respectivamente
		this.obtenerPistaPais(pais) + " " + this.obtenerPistaVillanoSenaParticular(villano)

	}

}
