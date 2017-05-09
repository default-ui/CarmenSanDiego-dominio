package appModel

import org.uqbar.commons.utils.Transactional
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Lugar

@Transactional
@Observable
@Accessors
class OrdenDeArrestoAppModel {
	
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo) {
		this.repo = repo
	}
	
	def pedirTodasLasPistas() {
		for(Lugar lugar : repo.lugaresPistas){
			repo.pistas.put(lugar.nombre, pedirPista(lugar))
		}
	}
	
	def pedirPista(Lugar lugar) {
		repo.juego.pedirPista(lugar)
	}
	
	def getPathImagenOrden() {
		"orden.png"
	}
}