package miniModel

import carmenSanDiego.Villano
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MiniVillano {
	
	Integer id
	String nombre
	
	new(Villano villano) {
		this.id = villano.id
  		this.nombre = villano.nombre
  	}
}