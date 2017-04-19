package utils

import carmenSanDiego.Expediente
import carmenSanDiego.Mapamundi

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
	
	def static crearExpedienteDummy() {
		new Expediente => [
			generarExpedienteAleatorio
		]
	}
	
}
