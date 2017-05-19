package miniModel

import carmenSanDiego.Pais
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.Lugar

/**
 * Minipais con lugares y conexiones
 * clase utilizada cuando se hace el get de pais by id
 */
@Accessors
class MiniPaisConConexiones extends MiniPais{
	
	List<String> lugares
	List<Conexion> conexiones
	
	new(Pais pais) {
		super(pais)
		this.conexiones = reducirConexiones(pais.conexiones)
		this.lugares = pais.lugares.nombres
	}
	
	/**
	 * transforma una lista de paises(conexiones) en una lista de instancias de Conexion
	 */
	def reducirConexiones(List<Pais> paises) {
		paises.map([it.toConexion])
	}
	
	
	def toConexion(Pais pais) {
		new Conexion(pais)
	}
	
	def getNombres(List<Lugar> lugares){
		lugares.map([it.nombre])
	}
	
}