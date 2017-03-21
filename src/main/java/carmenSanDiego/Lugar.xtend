package carmenSanDiego

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

abstract class Lugar {
	@Accessors Pais destino = null
	@Accessors Villano villano = null
	
	def String obtenerPistas(){
		
	}
	
	def Object getNombre(){
	}
	
	def Villano getVillano(){
		villano
	}
	
	def  Pais getDestino(){
		destino
	}
	
	def String obtenerPista(Pais pais, Villano villano)
	
	def String obtenerPistaPais(Pais pais){
		//var int randomPais = new Random().nextInt(destino.caracteristicas.length) -1
		var int randomPais = 0
		destino.caracteristicas.get(randomPais)
	}
	
	def String obtenerPistaVillanoSenaParticular(Villano villano){
		//var int randomVillano = new Random().nextInt(villano.senasParticulares.length) -1
		var int randomVillano = 0
		villano.senasParticulares.get(randomVillano)
	}
	
	def String obtenerPistaVillanoHobbies(Villano villano){
		//var int randomVillano = new Random().nextInt(villano.hobbies.length) -1
		var int randomVillano = 0
		villano.hobbies.get(randomVillano)
	}
	
	}