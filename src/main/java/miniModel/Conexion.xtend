package miniModel

import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

/**
 * Clase que representa las conexiones de los paises de manera mas simple acomodandose al enunciado
 */
@Accessors
class Conexion {
	
	String nombre
	
	new(Pais pais){
		nombre = pais.nombre
	}
	
}