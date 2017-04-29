package appModel

import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import carmenSanDiego.CarmenSanDiegoRepo
import org.uqbar.commons.model.UserException

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
	
	def eliminarPais() {
		if (paisSeleccionado==null) {
					//new ErrorDialog(this, modelObject).open
			throw new UserException('No hay país seleccionado')
		} else {
			repo.mapa.eliminarPais(paisSeleccionado.nombre)					
		}
	}
	
	def editarPais(){
		if (paisSeleccionado==null) {
					//new ErrorDialog(this, modelObject).open
					throw new UserException('No hay país seleccionado')
				}
				repo.paisTemp=paisSeleccionado
				repo.nuevoPaisNombre=repo.paisTemp.nombre
				
	}
	
	def nuevoPais(){
		repo.paisTemp= new Pais("temp")
		repo.nuevoPaisNombre=""	
	}
	
	
	
	
	
	
	
	
	
	
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	
	
	
	
	
	
	
	
}