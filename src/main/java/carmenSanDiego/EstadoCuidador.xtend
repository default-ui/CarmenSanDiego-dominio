package carmenSanDiego

class EstadoCuidador extends EstadoOcupante {
	/**
	 * El cuidador responde al jugador el villano no paso por ese pais y que debe salir a buscarlo
	 * en otro lugar.
	 */
	override responder(Pais pais, Lugar lugar, Villano villano) {
		return "No vimos a nadie con tales caracteristicas por esta zona, creo que te equivocaste"
	}

}
