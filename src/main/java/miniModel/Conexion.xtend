package miniModel

import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Conexion {
	
	String nombre
	
	new(Pais pais){
		nombre = pais.nombre
		
	}
}