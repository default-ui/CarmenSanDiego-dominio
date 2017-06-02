package miniModel

import carmenSanDiego.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import carmenSanDiego.Sexo

@Accessors
class MiniVillanoConCaracateristicas {
	Integer id
	String nombre
	Sexo sexo
	List<String> hobbies
	List<String> senasParticulares
	
	new(Villano villano) {
		this.id = villano.id
		this.sexo = villano.sexo
  		this.nombre = villano.nombre
  		this.hobbies = villano.hobbies
  		this.senasParticulares = villano.senasParticulares
  	}
}