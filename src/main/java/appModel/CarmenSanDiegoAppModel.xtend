package appModel

import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import utils.DummyData

/**
 * AppModel del juego
 */
@Transactional
@Observable
@Accessors
class CarmenSanDiegoAppModel {
	
	
	Juego juego = new Juego(mapa, expediente)
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	
	// Otros appModels
	ExpedienteAppModel expedienteAppModel = new ExpedienteAppModel(expediente)
	MapamundiAppModel mapamundiAppModel = new MapamundiAppModel(mapa)
	
	/**
	 * Inicializa valores para una nueva partida
	 */
	def iniciarNuevaPartida() {
	 	
		juego = new Juego(mapa, expediente)
		juego.crearCaso
		
		repo.lugaresPistas = juego.paisActual.lugares

		/// Otros appModels
		expedienteAppModel = new ExpedienteAppModel(expediente)
		mapamundiAppModel = new MapamundiAppModel(mapa)
	 	
	 }
	 
	/************
	 * Lugares *
	 ************/
	 
	/**
	 * Devuelve TRUE cuando NO estoy en el primer pais del caso
	 * Es decir, tengo un pais anterior al cual volver
	 */
	def puedeVolver() {
		juego.caso.paisDelRobo.nombre != juego.paisActual.nombre
	}
	
	def tituloInicioDeJuego() {
		var objetoDelRobo = juego.caso.objeto
		// se setea en ExpedienteAppModel porque tambien lo necesita para uno de sus titulos
		expedienteAppModel.objeto = objetoDelRobo
		"Robo de: " + objetoDelRobo
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
	
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenViajar() {
		"viajar.png"
	}
	
	def getPathImagenResolviendo() {
		"resolviendo.png"
	}
	
	def getPathImagenOrden() {
		"orden.png"
	}
	
	def getPathImagenIntro() {
		"intro.jpg"
	
	}	
	
	def getPathImagenInicio(){
		"inicio.png"
	}
	
	def getPathImagenLost(){
		"lost.png"
	}
	
	def getPathImagenWon(){
		"won.png"
	}
}
