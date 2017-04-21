package utils

import carmenSanDiego.Mapamundi
import carmenSanDiego.Caso
import carmenSanDiego.Villano
import carmenSanDiego.Expediente
import carmenSanDiego.Juego

/**
 * Esta clase es simplemente un utils para crear objetos tontos
 * que sirva de ejemplo para mostrar en las ventanas.
 * 
 * NO es ningun patron, NO es una practica recomendada, pero 
 * cuando queremos mostrar un ejemplo nos interesa que tenga datos.
 * 
 * Es solo UNA forma de crearlos.
 * 
 */
class DummyData {
	
	def static crearMapamundiDummy() {
		new Mapamundi => [
			generarMapamundiAleatorio
		]
	}
	
	def static crearCasoDummy() {
		val expediente = new Expediente()
		expediente.generarExpedienteAleatorio()
		val juego = new Juego(crearMapamundiDummy(), expediente)
		juego.caso
	}
	
}
