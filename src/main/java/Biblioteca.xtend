package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors

class Biblioteca implements Lugar{
	@Accessors String nombre = "Library"
	
	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}