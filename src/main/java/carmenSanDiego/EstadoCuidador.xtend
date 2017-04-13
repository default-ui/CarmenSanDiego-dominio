package carmenSanDiego

/**
 * El villano no pasó por el país
 */
class EstadoCuidador extends EstadoOcupante {
	
	/**
	 * El cuidador responde que el villano no paso por ese pais y que debe buscarlo en otro lugar.
	 */
	override responder(Pais pais, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
		return "No vimos a nadie con tales caracteristicas por esta zona, creo que te equivocaste."
	}

}
