package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional

@Observable
@Transactional
@Accessors
class CaracteristicasAppModel {
	
	String caracteristica
	String caracteristicaAEliminar
	CarmenSanDiegoRepo repo

	new(CarmenSanDiegoRepo repositorio){
		repo=repositorio
	}
	
	def agregarCaracteristica(){
		repo.paisTemp.agregarCaracteristica(caracteristica)
	}
	
	def eliminarCaracteristica() {
		repo.paisTemp.eliminarCaracteristica(caracteristicaAEliminar)
	}
	
	def getPathImagenCaracteristicas(){
		"caracteristicas.png"
	}
}