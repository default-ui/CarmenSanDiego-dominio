package carmenSanDiego

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Villano {

	String nombre
	Sexo sexo
	List<String> senasParticulares = <String>newArrayList()
	List<String> hobbies = <String>newArrayList()

	new(String nombre, Sexo sexo) {
		this.nombre = nombre
		this.sexo = sexo
		this.senasParticulares = new ArrayList<String>()
	}

	def agregarSena(String sena) {
		senasParticulares.add(sena)
	}

	def void eliminarSena(String sena) {
		this.senasParticulares.remove(senasParticulares.indexOf(sena))
	}

	def void editarSena(String antigua, String nueva) {
		this.eliminarSena(antigua)
		this.agregarSena(nueva)
	}

	def agregarHobbie(String hobbie) {
		hobbies.add(hobbie)
	}

	def void eliminarHobbie(String hobbie) {
		this.hobbies.remove(hobbies.indexOf(hobbie))
	}

	def void editarHobbie(String antiguo, String nuevo) {
		this.eliminarHobbie(antiguo)
		this.agregarHobbie(nuevo)
	}
	
	override toString() {
		
		var sb = new StringBuilder();
		
		sb.append("-- Villano --").append(System.getProperty("line.separator"));
		
		sb.append("Nombre: " + nombre).append(System.getProperty("line.separator"));
		sb.append("Sexo: " + sexo).append(System.getProperty("line.separator"));
		
		sb.append("- Señas Particulares:").append(System.getProperty("line.separator"));
		for (s : senasParticulares) {
			sb.append(s).append(System.getProperty("line.separator"));
		}
		
		sb.append("- Hobbies:").append(System.getProperty("line.separator"));
		for (h : hobbies) {
			sb.append(h).append(System.getProperty("line.separator"));
		}
		
		sb.toString
				
	}

}
