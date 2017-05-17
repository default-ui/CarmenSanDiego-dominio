package miniModel

import carmenSanDiego.Lugar
import carmenSanDiego.Pais
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

/**
 * clase MiniPais, sin conexiones, solo nombre de pais y lugares
 */
@Accessors
class MiniPais {
	
	String nombre
	List<String> lugares
	
	new(Pais pais) {
		this.nombre = pais.nombre
//		this.caracteristicas = pais.caracteristicas
//		this.conexionesIds = pais.conexiones.listIds
//		this.estadoOcupante = pais.estadoOcupante
		this.lugares = pais.lugares.nombres
	}
	
	def listIds(List<Pais> paises) {
		paises.map([it.nombre])
	}
	
	def getNombres(List<Lugar> lugares){
		lugares.map([it.nombre])
	}
}