package carmenSanDiego

import java.util.List

class Villano {
	
	String nombre
	Sexo sexo
	List<String> senasParticulares
	List<String> hobbies
	
	new(String nombre, Sexo sexo) {
		this.nombre = nombre
		this.sexo = sexo
	}
	
	def getNombre() {
		nombre
	}
	
	def getSexo() {
		sexo.name()
	}
	
}