package miniModel

import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

/**
 * clase MiniPais, sin conexiones ni lugares, solo id y nombre de pais
 */
@Accessors
class MiniPais {
	
	Integer id
	String nombre
	
	new(){
		this.id = 0
		this.nombre = ""
	}
	
	new(Pais pais) {
		this.id = pais.id
		this.nombre = pais.nombre
		
	}
	

}