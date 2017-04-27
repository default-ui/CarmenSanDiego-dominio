package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import org.uqbar.commons.utils.Transactional
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.Lugar

@Transactional
@Observable
@Accessors
class ViajarAppModel {
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repositorio){
		repo=repositorio
	}
	
	def pedirTodasLasPistas() {
		for(Lugar lugar : repo.lugaresPistas){
			repo.pistas.put(lugar.nombre, pedirPista(lugar))
		}
	}
	
	def pedirPista(Lugar lugar) {
		repo.juego.pedirPista(
			lugar, 
			repo.juego.caso.responsable,
			repo.juego.proximoPais,
			repo.juego.ordenDeArresto
		)
	}
	
	def getPathImagenViajar() {
		"viajar.png"
	}
	
	def puedeVolver() {
		repo.juego.caso.paisDelRobo.nombre != repo.juego.paisActual.nombre
	}
}