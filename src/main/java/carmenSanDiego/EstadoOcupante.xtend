package carmenSanDiego

abstract class EstadoOcupante {

	/*
	 * Segun el estado en el que se encuentre el ocupante del lugar se respondera con informacion sobre el villano,
	 * se podra ejecutar el arresto o se guiara al jugador hacia otros destinos.
	 */
	def String responder(Pais siguienteDestino, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto)
	
}
