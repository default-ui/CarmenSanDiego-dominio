package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors

abstract class Lugar {

	@Accessors String nombre
	@Accessors Pais destino
	@Accessors Villano villano

	def String obtenerPistas()

	def String obtenerPista(Pais pais, Villano villano)

	def String obtenerPistaPais(Pais pais) {
		// var int randomPais = new Random().nextInt(destino.caracteristicas.length) -1
		var int randomPais = 0
		destino.caracteristicas.get(randomPais)
	}

	def String obtenerPistaVillanoSenaParticular(Villano villano) {
		// var int randomVillano = new Random().nextInt(villano.senasParticulares.length) -1
		var int randomVillano = 0
		villano.senasParticulares.get(randomVillano)
	}

	def String obtenerPistaVillanoHobbies(Villano villano) {
		// var int randomVillano = new Random().nextInt(villano.hobbies.length) -1
		var int randomVillano = 0
		villano.hobbies.get(randomVillano)
	}

}
