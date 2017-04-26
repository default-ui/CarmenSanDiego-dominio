package appModel

import carmenSanDiego.Lugar
import carmenSanDiego.CarmenSanDiegoRepo
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Transactional
@Accessors
class EditarLugaresAppModel {
	Lugar lugarAEliminar
	Lugar lugar
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repositorio){
		repo=repositorio
	}
	
	def agregarLugar() {
		repo.paisTemp.agregarLugar(lugar)
	}
	
	def eliminarLugar() {
		repo.paisTemp.eliminarLugar(lugarAEliminar)
	}
	
	def validarCantidadLugares(Integer cantidadLugares) {
		val minimaCantidadDeLugares = 3
		if (cantidadLugares > minimaCantidadDeLugares) {
			this.excepcionLugares("mas", minimaCantidadDeLugares)
		}		
		if (cantidadLugares < minimaCantidadDeLugares) {
			this.excepcionLugares("menos", minimaCantidadDeLugares)
		}
	}
	
	private def excepcionLugares(String diferencia, Integer minimaCantidadDeLugares) {
		throw new UserException('''No puede ingresar '+diferencia+' de '+minimaCantidadDeLugares+' lugares''')
	}
	
	def getPathImagenLugares(){
		"lugares.png"
	}
	
}