package miniModel

import java.util.List
import carmenSanDiego.Pais
import carmenSanDiego.Lugar
import carmenSanDiego.EstadoOcupante
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MiniPais {
	
	String nombre
	List<String> lugares
	
	new(Pais pais) {
		this.nombre = pais.nombre
		this.lugares = pais.lugares.nombres
	}
	
	def listIds(List<Pais> paises) {
		paises.map([it.nombre])
	}
	
	def getNombres(List<Lugar> lugares){
		lugares.map([it.nombre])
	}
}