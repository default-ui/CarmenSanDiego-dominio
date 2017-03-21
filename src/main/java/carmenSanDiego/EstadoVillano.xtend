package carmenSanDiego

class EstadoVillano extends EstadoOcupante {
	
	override responder(Pais pais, Lugar lugar, Villano villano) {
		if(lugar.villano == null)
			"Peligro, el villano esta en el pais. Tene cuidado"
		else 
			"ALTO!"
			// y aca es donde no se de donde saco a orden de arresto
	}
	
}