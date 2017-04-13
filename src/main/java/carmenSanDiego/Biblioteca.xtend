package carmenSanDiego

class Biblioteca extends Lugar {

	new() {
		nombre = "Biblioteca"
	}

	override obtenerPista(Pais siguienteDestino, Villano villano) {
		
		var pista = this.obtenerPistaPais(siguienteDestino) + " " +
					this.obtenerPistaVillanoSenaParticular(villano)
						   
		// hay 50% de probabilidad de sacar una pista sobre los hobbies del villano
		if(randomGen.nextBoolean) {
			pista = pista + ' ' + this.obtenerPistaVillanoHobbie(villano)
		}
		
		pista
	}

}
