package appModel

import carmenSanDiego.Pais
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Transactional
@Accessors
class CaracteristicasAppModel {
	
	Pais temp
	String caracteristica
	String caracteristicaAEliminar
	
	def agregarCaracteristica(){
		temp.agregarCaracteristica(caracteristica)
	}
	
	def eliminarCaracteristica() {
		temp.eliminarCaracteristica(caracteristicaAEliminar)
	}
	
	def getPathImagenCaracteristicas(){
		"caracteristicas.png"
	}
}