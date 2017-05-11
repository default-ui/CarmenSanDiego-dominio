package miniModel

import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
/*
 * Clase que representa las conexiones de los paises de manera mas simple acomodandose al enunciado
 */

class Conexion {
	
	String nombre
	
	new(Pais pais){
		nombre = pais.nombre
		
	}
}