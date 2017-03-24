package carmenSanDiego

class EstadoVillano extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar, Villano villano) {
		if (lugar.villano == null)
			"Peligro, el villano está en el país. Tené cuidado"
		else
			"ALTO!"
	// y aca es donde no se de donde saco a orden de arresto
	}
	
	def void detenerSospechoso(Villano villano){
		//if(villano == villanoDeOrdenDeArresto)
		// responder deberia tener la orden de arresto pero si se la agrego le quito lo abstracto
			//detener()
			// "YOU WIN"
	}
	
		
	


}
