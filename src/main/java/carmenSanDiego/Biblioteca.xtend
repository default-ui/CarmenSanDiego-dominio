package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors


class Biblioteca extends Lugar{
	@Accessors String nombre = "Library"

	
	override getVillano() {
		villano
	}
	
	override getDestino() {
		destino
	}
	
	override obtenerPista(Pais pais, Villano villano) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}

