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
		repo.juego.pedirPista(lugar)
	}
	
	def getPathImagenViajar() {
		"viajar.png"
	}
	
	def puedeVolver() {
		repo.juego.caso.paisDelRobo.nombre != repo.juego.paisActual.nombre
	}
	
	def viajar(){
		repo.lugaresPistas=repo.juego.paisDestino.lugares
		repo.lugar1=repo.lugaresPistas.get(0)
		repo.lugar2=repo.lugaresPistas.get(1)
		repo.lugar3=repo.lugaresPistas.get(2)
		repo.juego.viajar(repo.juego.paisDestino)
		pedirTodasLasPistas
	}
	
	def volverAlPaisAnterior(){
		repo.juego.viajar(repo.juego.paisAnterior)
		pedirTodasLasPistas
	}
}