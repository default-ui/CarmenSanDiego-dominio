package carmenSanDiego

class Embajada  extends Lugar{
	
	override obtenerPistas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		// aca puede llegar a repetirse la pista. Hay que preocurar que no suceda (?)
		this.obtenerPistaPais(siguienteDestino) + " " + this.obtenerPistaPais(siguienteDestino) 
	}
	
}