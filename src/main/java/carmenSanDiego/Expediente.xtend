package carmenSanDiego

import java.util.Random

class Expediente {
	val villanos = <Villano>newArrayList()
	
	def nuevoVillano(String nombre, Sexo sexo){
		val villano = new Villano(nombre, sexo) 
		this.villanos.add(villano)
	}
	
	def eliminarVillano(Villano villano){
		this.villanos.remove(villanos.indexOf(villano))
	}
	
	def Villano obtenerVillano() {
		return villanos.get(new Random().nextInt(villanos.size()))
	}
	
}