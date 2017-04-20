package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Pais
import carmenSanDiego.Mapamundi

@Observable
@Accessors
class CrearPaisAppModel {
	Pais pais
	Mapamundi mapa
	
	new(Mapamundi mapa, String nombre){
		this.mapa = mapa
		pais = new Pais(nombre)
	}
	
	def agregarPais(String nombre){
		mapa.nuevoPais(nombre)
	}
}
