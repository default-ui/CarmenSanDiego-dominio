package carmenSanDiego

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

abstract class Lugar {

	@Accessors String nombre
	@Accessors Boolean seEncuentraVillano = false
	// TODO: cuando se inicialice el juego hay que asegurarse que el lugar en donde se encuentra el villano
	//se encuentre en true
	
	// inicializo el generador, genero setter para poder cambiarlo
	@Accessors Random randomGen = new Random() 

	def String obtenerPista(Pais siguienteDestino, Villano villano)

	/**
	 * Obtengo una caracteristica aleatoria del pais recibido por parametro
	 */
	def String obtenerPistaPais(Pais siguienteDestino) {
		var caracteristicas = siguienteDestino.caracteristicas
		caracteristicas.get( randomGen.nextInt(caracteristicas.size) )
	}

	/**
	 * Obtengo una Seña Particular aleatoria del villano recibido por parametro
	 */
	def String obtenerPistaVillanoSenaParticular(Villano villano) {
		var senas = villano.senasParticulares
		senas.get( randomGen.nextInt(senas.size) )
	}

	/**
	 * Obtengo un Hobbie aleatorio del villano recibido por parametro
	 */
	def String obtenerPistaVillanoHobbies(Villano villano) {
		var hobbies = villano.hobbies
		hobbies.get( randomGen.nextInt(hobbies.size) )
	}

}
