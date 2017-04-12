package carmenSanDiego

class Embajada  extends Lugar{
	
	new() {
		nombre = "Embajada"
	}

	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) + " " +
					this.obtenerPistaPais(siguienteDestino)
					
		pista
	}
	
}