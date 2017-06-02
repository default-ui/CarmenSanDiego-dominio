package miniModel

import carmenSanDiego.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class MiniVillanoConCaracateristicas {
	Integer id
	String nombre
	List<String> hobbies
	List<String> senasParticulares
	
	new(Villano villano) {
		this.id = villano.id
  		this.nombre = villano.nombre
  		this.hobbies = villano.hobbies
  		this.senasParticulares = villano.senasParticulares
  	}
}