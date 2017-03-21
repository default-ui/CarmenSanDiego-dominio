package carmenSanDiego

import carmenSanDiego.Lugar
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

class Banco extends Lugar {
	@Accessors String nombre = "Bank"
	
	override obtenerPistas() {
		return "PistaBanco"
	}
	
	
	override obtenerPista(Pais pais, Villano villano) {
		// obtengo un numero random para sacar una caracteristica de la lista de paises y
		//de villanos respectivamente
		this.obtenerPistaPais(pais) + " " + this.obtenerPistaVillanoSenaParticular(villano)
		
	}
	
}