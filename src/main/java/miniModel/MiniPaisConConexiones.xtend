package miniModel

import carmenSanDiego.Pais
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MiniPaisConConexiones extends MiniPais{
	
	List<Conexion> conexiones
	
	new(Pais pais) {
		super(pais)
		this.conexiones = reducirConexiones(pais.conexiones)
	}
	
	def reducirConexiones(List<Pais> paises) {
		paises.map([it.toConexion])
	}
	
	def toConexion(Pais pais) {
		new Conexion(pais)
	}
	
	
	
}