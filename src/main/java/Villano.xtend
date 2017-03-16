import java.util.List

class Villano {
	
	String nombre
	String sexo
	List<String> señasParticulares
	List<String> hobbies
	
	new(String unNombre) {
		nombre = unNombre
	}
	
	def getGetNombre() {
		nombre
	}
	
}