package carmenSanDiego

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
class Embajada  extends Lugar{
	@Accessors Boolean seEncuentraVillano = false
	@Accessors String nombre = "Embajada"
	new() {
		
	}

	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		var pista1 = obtenerPistaPais(siguienteDestino)
		var pista2 = obtenerPistaPais(siguienteDestino)
		while (pista2==pista1){
			pista2 = obtenerPistaVillanoSenaParticular(villano)
		}
		var pista = pista1 + pista2
		
		
		pista
	}
	
}