package carmenSanDiego

class EstadoInformante extends EstadoOcupante {

	/* Si hay un informante quiere decir que el villano paso por ese pais. 
	 * El informante del lugar responde con una pista sobre e villano. 
	 * */
	override responder(Pais pais, Lugar lugar, Villano villano, Pais destino) {
		lugar.obtenerPista(pais, villano, destino)

	}

}
