package appModel

import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import carmenSanDiego.CarmenSanDiegoRepo

@Observable
@Transactional
@Accessors
class MapamundiAppModel {
	CarmenSanDiegoRepo repo
	Mapamundi mapa
	
	new(CarmenSanDiegoRepo repositorio){
		repo=repositorio
	}

	Pais paisSeleccionado
	
	new(Mapamundi map){
		mapa = map
		paisSeleccionado = mapa.paises.get(0)
	}
	
	/************
	 * Mapamundi *
	 ************/
	
	
	
	
	
	
	
	
	
	
	
	
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	
	
	
	
	
	
	
	
}