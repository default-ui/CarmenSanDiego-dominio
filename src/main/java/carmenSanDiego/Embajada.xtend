package carmenSanDiego

class Embajada  extends Lugar{
	
	new() {
		nombre = "Embasy"
	}

	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		// TODO: aca puede llegar a repetirse la pista. Hay que preocurar que no suceda (?)
		var pista = this.obtenerPistaPais(siguienteDestino) + " " +
					this.obtenerPistaPais(siguienteDestino)
					
		pista
	}
	
}