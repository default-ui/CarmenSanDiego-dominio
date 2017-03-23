package carmenSanDiego

class EstadoCuidador extends EstadoOcupante {
	/**
	 * El cuidador responde al jugador el villano no paso por ese pais y que debe salir a buscarlo
	 * en otro lugar.
	 */
	override responder(Pais pais, Lugar lugar, Villano villano, Pais destino) {
		return "No vimos a nadie así por esta zona, creo que te equivocaste"
	}

}
