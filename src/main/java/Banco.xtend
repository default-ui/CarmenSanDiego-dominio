package carmenSanDiego

import carmenSanDiego.Lugar
import org.eclipse.xtend.lib.annotations.Accessors

class Banco implements Lugar {
	@Accessors String nombre = "Bank"
	
	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}