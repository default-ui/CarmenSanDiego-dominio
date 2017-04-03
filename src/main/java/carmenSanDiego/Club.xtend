package carmenSanDiego

class Club extends Lugar{
	
	new() {
		nombre = "Club"
	}

	override obtenerPistas() {
		"PistaClub"
	}
	
	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		// TODO devuelve 2 pistas sobre villano?
		var pista = this.obtenerPistaVillanoSenaParticular(villano) + " " + 
					this.obtenerPistaVillanoSenaParticular(villano) + " "
		
		// el 70% de las veces agrega una pista sobre los hobbies del villano
		if( randomGen.nextInt(10) < 7) {
			pista + this.obtenerPistaVillanoHobbies(villano)
		}
		
		pista
	}
	
}