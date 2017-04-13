package carmenSanDiego

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.LinkedList

abstract class Lugar {

	@Accessors String nombre
	@Accessors Boolean seEncuentraVillano = false
	// TODO: cuando se inicialice el juego hay que asegurarse que el lugar en donde se encuentra el villano
	//se encuentre en true
	
	// inicializo el generador, genero setter para poder cambiarlo
	@Accessors Random randomGen = new Random() 

	/*
	 * se obtiene una o varias pistas relacionadas con el villano. Cada lugar aporta un tipo de informacion
	 * distinta.
	 */
	def String obtenerPista(Pais siguienteDestino, Villano villano)

	/**
	 * Obtengo una caracteristica aleatoria del pais recibido por parametro
	 */
	def String obtenerPistaPais(Pais siguienteDestino) {
		var LinkedList<String> caracteristicas = new LinkedList<String> (siguienteDestino.caracteristicas)
		caracteristicas.remove( randomGen.nextInt(caracteristicas.size) )
	}

	/**
	 * Obtengo una Seña Particular aleatoria del villano recibido por parametro
	 */
	def String obtenerPistaVillanoSenaParticular(Villano villano) {
		var LinkedList<String> senas = new LinkedList<String> (villano.senasParticulares)
		senas.remove( randomGen.nextInt(senas.size) )
	}

	/**
	 * Obtengo un Hobbie aleatorio del villano recibido por parametro
	 */
	def String obtenerPistaVillanoHobbie(Villano villano) {
		var LinkedList<String> hobbies = new LinkedList<String> (villano.hobbies)
		hobbies.remove( randomGen.nextInt(hobbies.size) )
	}

}
