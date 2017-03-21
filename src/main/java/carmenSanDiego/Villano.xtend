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
	
	def agregarSena (String sena){
		senasParticulares.add(sena)
	}
	
	def void eliminarSena (String sena){
		this.senasParticulares.remove(senasParticulares.indexOf(sena))
	}
	
	def void editarSena (String antigua, String nueva){
		this.eliminarSena(antigua)
		this.agregarSena(nueva)
	}
	
	def agregarHobbie(String hobbie){
		hobbies.add(hobbie)
	}
	
	def void eliminarHobbie (String hobbie){
		this.hobbies.remove(hobbies.indexOf(hobbie))
	}
	
	def void editarHobbie (String antiguo, String nuevo){
		this.eliminarHobbie(antiguo)
		this.agregarHobbie(nuevo)
	}
	
		
}