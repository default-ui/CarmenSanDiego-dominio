package carmenSanDiego

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
class Biblioteca extends Lugar {
	@Accessors Boolean seEncuentraVillano = false
	@Accessors String nombre = "Biblioteca"
	new() {
		
		
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) +
					this.obtenerPistasVillanoSenaParticular(villano).get(0)
						   
		// hay 50% de probabilidad de sacar una pista sobre los hobbies del villano
		if(randomGen.nextBoolean) {
			pista = pista + this.obtenerPistaVillanoHobbie(villano)
		}
		
		pista
	}

}
