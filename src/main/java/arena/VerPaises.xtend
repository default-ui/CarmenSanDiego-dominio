package arena

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Dependencies
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import java.util.ArrayList

@Accessors
@Observable
class VerPaises {
	val mapa = new Mapamundi
	List<Pais> paises
	Pais paisSeleccionado
	
	new(){
		this.mapa.generarMapamundiAleatorio()
		this.paises = mapa.paises
	}
	
	@Dependencies("paisSeleccionado")
	def getValorNuevo() {
		paisSeleccionado.nombre
	}
	
	def void setValorNuevo(String unValorNuevo) {
		paisSeleccionado.nombre = unValorNuevo
	}
	
	@Dependencies("paisSeleccionado")
	def Boolean getValorEnabled() {
		paisSeleccionado != null
	}
}