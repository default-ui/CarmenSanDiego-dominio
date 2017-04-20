package utils

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
		val lugares = new ArrayList()
		lugares.add(new Banco())
		lugares.add(new Biblioteca())
		lugares.add(new Embajada())
		lugares.add(new Club())
		return lugares
	}
	
}
