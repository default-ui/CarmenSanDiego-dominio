package appModel

import carmenSanDiego.Expediente
import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import carmenSanDiego.Villano
import java.util.ArrayList
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import utils.DummyData
import java.util.Map

/**
 * AppModel del juego
 */

@Transactional
@Observable
@Accessors
class CarmenSanDiegoAppModel {
	
	Mapamundi mapa = DummyData.crearMapamundiDummy
	Expediente expediente = DummyData.crearExpedienteDummy
	Juego juego = new Juego(mapa, expediente)
	Pais pais
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	List<Lugar> lugaresPistas = new ArrayList<Lugar>
	Villano villanoDeNuevaOrdenDeArresto
	String pistasBanco
	String pistasBiblioteca
	String pistasClub
	String pistasEmbajada
	Lugar lugarAbierto
	Map<String, String> pistas = new HashMap<String, String>()
	/// Otro appModels
	ExpedienteAppModel expedienteAppModel = new ExpedienteAppModel(expediente)
	MapamundiAppModel mapamundiAppModel = new MapamundiAppModel(mapa)
	
	
	
	/************
	 * Lugares *
	 ************/
	 
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
		expedienteAppModel.objeto = objetoDelRobo
		"Robo de: " + objetoDelRobo
	}
	
	def pedirTodasLasPistas() {
		for(Lugar lugar : lugaresPistas){
			pistas.put(lugar.nombre ,pedirPista(lugar))
		}
	}
	
	def pistaActual() {
		pistas.get(lugarAbierto.nombre)
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
}
