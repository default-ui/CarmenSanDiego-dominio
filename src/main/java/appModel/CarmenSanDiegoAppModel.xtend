package appModel

import carmenSanDiego.Expediente
import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Villano
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import utils.DummyData
import carmenSanDiego.CarmenSanDiegoRepo

/**
 * AppModel del juego
 */
@Transactional
@Observable
@Accessors
class CarmenSanDiegoAppModel {
	
	CarmenSanDiegoRepo repositorio = new CarmenSanDiegoRepo()
	Juego juego = new Juego(repositorio.mapa, repositorio.expediente)
	List<Lugar> lugaresPistas = new ArrayList<Lugar>
	Villano villanoDeNuevaOrdenDeArresto
	Lugar lugarAbierto
	Map<String, String> pistas = new HashMap<String, String>()
	
	// Otros appModels
	
	
	/**
	 * Inicializa valores para una nueva partida
	 */
	def iniciarNuevaPartida() {
	 	
		juego = new Juego(repositorio.mapa, repositorio.expediente)
		juego.crearCaso
		
		lugaresPistas = juego.paisActual.lugares

		/// Otros appModels
		
	 	
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
	
	def pedirPista(Lugar lugar) {
		
		juego.pedirPista(
			lugar, 
			juego.caso.responsable,
			juego.proximoPais,
			juego.ordenDeArresto
		)
		
	}
	
	def tituloInicioDeJuego() {
		var objetoDelRobo = juego.caso.objeto
		// se setea en ExpedienteAppModel porque tambien lo necesita para uno de sus titulos
		//repositorio.expedienteAppModel.objeto = objetoDelRobo
		"Robo de: " + objetoDelRobo
	}
	
	def pedirTodasLasPistas() {
		for(Lugar lugar : lugaresPistas){
			pistas.put(lugar.nombre, pedirPista(lugar))
		}
	}
	
	def pistaActual() {
		pistas.get(lugarAbierto.nombre)
	}
	
		def victoria(){
		var vict = #["Enhorabuena!!!", "Has detenido a " + juego.ordenDeArresto.villano.nombre + " y recuperado " + juego.caso.objeto, "Felicitaciones!!!" ]
		vict
	}
	
	def derrotaPorVillanoIncorrecto(){
		var malasNot = #["Malas noticias :(", "Has detenido a " + juego.caso.responsable.nombre + ".", "Tenias una orden de arresto contra: " 
			+ villanoDeNuevaOrdenDeArresto.nombre + ".", "Lamentablemente este crimen quedara impune." 
		]
		malasNot
	}
	
	def derrotaPorNoOrdenDeArresto(){
		var sinOrden = #["Malas noticias :(", "No contabas con una orden de arresto para detener al criminal.", "Lamentablemente este crimen quedara impune."]
		sinOrden
	}
	
		
	def buttonVictoria() {
		"Disfrutar la victoria"
	}
	
	def buttonDerrota() {
		"Aceptar el error"
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
