package carmenSanDiego

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.LinkedList
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.util.List

@Observable abstract class Lugar {
	
	
	@Accessors Boolean detenido = false
	@Accessors String nombre
	@Accessors Boolean seEncuentraVillano
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
		var caracteristica = caracteristicas.remove( randomGen.nextInt(caracteristicas.size) ) + ". "
		caracteristica
	}
	
	/**
	 * Obtengo una Seña Particular aleatoria del villano recibido por parametro
	 */
	def String obtenerPistaVillanoSenaParticular(Villano villano) {
		var LinkedList<String> senas = new LinkedList<String> (villano.senasParticulares)
		// se le da formato. Ejemplo: "Es de pelo negro."
		var sena = "Es " + senas.remove( randomGen.nextInt(senas.size) ).toLowerCase + ". "
		sena
	}
	
	/**
	 * Obtengo un Hobbie aleatorio del villano recibido por parametro
	 */
	def String obtenerPistaVillanoHobbie(Villano villano) {
		var LinkedList<String> hobbies = new LinkedList<String> (villano.hobbies)
		// se le da formato de la forma: "Se rumorea que disfruta de coleccionar joyas."
		// TO DO: esta bien que el formateo de las frases vaya aca? (me parece que no)
		var hobby = "Se rumorea que disfruta de " + hobbies.remove( randomGen.nextInt(hobbies.size) ).toLowerCase + ". "
		hobby
	}
	
	def hayDetenido(){
		detenido = true
	}
	

}
