package miniModel

import carmenSanDiego.Pais
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
/*
 * clase utilizada cuando se hace el get de pais by id
 */
class MiniPaisConConexiones extends MiniPais{
	
	List<Conexion> conexiones
	
	new(Pais pais) {
		super(pais)
		this.conexiones = reducirConexiones(pais.conexiones)
	}
	
	/*
	 * transforma una lista de paises(conexiones) en una lista de instancias de Conexion
	 */
	def reducirConexiones(List<Pais> paises) {
		paises.map([it.toConexion])
	}
	
	
	def toConexion(Pais pais) {
		new Conexion(pais)
	}
	
	
	
}