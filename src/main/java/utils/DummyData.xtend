package utils

import carmenSanDiego.Expediente
import carmenSanDiego.Mapamundi
import java.util.ArrayList
import carmenSanDiego.Banco
import carmenSanDiego.Biblioteca
import carmenSanDiego.Embajada
import carmenSanDiego.Club

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

	def static crearArrayDeLugaresPosibles(){
		new ArrayList() => [
			add(new Banco)
			add(new Biblioteca)
			add(new Embajada)
			add(new Club)
		]
	}

	def static crearExpedienteDummy() {
		new Expediente => [
			generarExpedienteAleatorio
		]

	}
	
}


