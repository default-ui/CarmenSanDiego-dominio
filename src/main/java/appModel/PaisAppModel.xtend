package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.Pais

@Observable
@Transactional
@Accessors
class PaisAppModel {
	CarmenSanDiegoRepo repo
	Pais paisSeleccionado
	
	
	new (CarmenSanDiegoRepo repositorio, Pais paisSeleccionado){
		repo=repositorio
		this.paisSeleccionado=paisSeleccionado
	}
	
	def agregarPais(){
		//validarCantidadLugares(temp.lugares.size)
		repo.paisTemp.nombre = repo.nuevoPaisNombre
		repo.mapa.paises.add(repo.paisTemp)
	}
	
	def getPathImagenNuevoPais(){
		"nuevo_pais.png"
	}
}