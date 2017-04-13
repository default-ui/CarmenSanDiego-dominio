package carmenSanDiego

/**
 * El villano pasó por el país
 */
class EstadoInformante extends EstadoOcupante {

	/**
	 * El informante responde con una pista sobre el villano.
	 * */
	override responder(Pais pais, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
		lugar.obtenerPista(pais, villano)
	}

}