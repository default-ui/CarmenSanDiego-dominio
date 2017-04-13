package carmenSanDiego

/**
 * El villano pasó por el país
 */
class EstadoInformante extends EstadoOcupante {

	/**
	 * El informante responde con una pista sobre el villano.
	 * */
	override responder(Pais siguienteDestino, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
		lugar.obtenerPista(siguienteDestino, villano)
	}

}