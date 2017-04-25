package carmenSanDiego

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
class Banco extends Lugar {
	@Accessors Boolean seEncuentraVillano = false
	@Accessors String nombre = "Banco"
	new() {
		
		
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) + 
					this.obtenerPistaVillanoSenaParticular(villano)
					
		pista
	}

}
