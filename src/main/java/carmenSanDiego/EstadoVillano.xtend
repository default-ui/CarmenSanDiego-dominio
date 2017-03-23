package carmenSanDiego

class EstadoVillano extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar, Villano villano, Pais destino) {
		if (lugar.villano == null)
			"Peligro, el villano está en el país. Tené cuidado"
		else
			"ALTO!"
	// y aca es donde no se de donde saco a orden de arresto
	}

}
