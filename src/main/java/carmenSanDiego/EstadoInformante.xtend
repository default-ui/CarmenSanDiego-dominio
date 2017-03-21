package carmenSanDiego

class EstadoInformante extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar) {
		pais.obtenerPista(lugar)
	}

}
