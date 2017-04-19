package carmenSanDiego

import org.uqbar.commons.utils.Observable

@Observable
class Banco extends Lugar {

	new() {
		nombre = "Banco"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) + 
					this.obtenerPistaVillanoSenaParticular(villano)
					
		pista
	}

}
