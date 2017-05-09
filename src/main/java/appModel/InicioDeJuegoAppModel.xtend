package appModel

import org.uqbar.commons.utils.Transactional
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Lugar

@Transactional
@Observable
@Accessors
class InicioDeJuegoAppModel {
	
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo) {
		this.repo = repo
	}
	
	def tituloInicioDeJuego() {
		var objetoDelRobo = repo.juego.caso.objeto
		// se setea en ExpedienteAppModel porque tambien lo necesita para uno de sus titulos
		//repositorio.expedienteAppModel.objeto = objetoDelRobo
		"Robo de: " + objetoDelRobo
	}
	
	def pedirTodasLasPistas() {
		repo.lugar1=repo.lugaresPistas.get(0)
		repo.lugar2=repo.lugaresPistas.get(1)
		repo.lugar3=repo.lugaresPistas.get(2)
		for(Lugar lugar : repo.lugaresPistas){
			repo.pistas.put(lugar.nombre, pedirPista(lugar))
		}
	}
	
	def pedirPista(Lugar lugar) {
		repo.juego.pedirPista(lugar)
	}
	
	def getPathImagenInicio(){
		"inicio.png"
	}
}