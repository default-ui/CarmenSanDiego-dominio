package carmenSanDiego

import java.util.Random

class Expediente {

	val villanos = <Villano>newArrayList()

	// TODO esto no se si es necesario, podria ser mas simple recibir el villano ya creado
	def nuevoVillano(String nombre, Sexo sexo) {
		val villano = new Villano(nombre, sexo)
		this.villanos.add(villano)
	}

	def eliminarVillano(Villano villano) {
		this.villanos.remove(villanos.indexOf(villano))
	}

	// TODO aca hay que permitir cambiar el Random	
	def Villano obtenerVillano() {
		return villanos.get(new Random().nextInt(villanos.size()))
	}

}
