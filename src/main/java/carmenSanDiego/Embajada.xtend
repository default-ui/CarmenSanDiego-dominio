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
		var pistas = obtenerPistasPais(siguienteDestino)
		var pista = pistas.get(0) + pistas.get(1)
		
					
		pista
	}
	
}