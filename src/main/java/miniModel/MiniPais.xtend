package miniModel

import java.util.List
import carmenSanDiego.Pais
import carmenSanDiego.Lugar
import carmenSanDiego.EstadoOcupante
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MiniPais {
	
	String nombre
	List<String> caracteristicas
	List<String> conexionesIds
	List<Lugar> lugares
	EstadoOcupante estadoOcupante
	
	new(Pais pais) {
		this.nombre = pais.nombre
		this.caracteristicas = pais.caracteristicas
		this.conexionesIds = pais.conexiones.listIds
		this.lugares = pais.lugares
		this.estadoOcupante = pais.estadoOcupante
	}
	
	def listIds(List<Pais> paises) {
		paises.map([it.nombre])
	}
	
	
}