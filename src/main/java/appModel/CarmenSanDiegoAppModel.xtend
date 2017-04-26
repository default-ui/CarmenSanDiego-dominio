package appModel

import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import java.util.List
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
	
	
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	CarmenSanDiegoRepo repositorio = new CarmenSanDiegoRepo()
	Juego juego = new Juego(repositorio.mapa, repositorio.expediente)
	
	// Otros appModels
	
	
	/**
	 * Inicializa valores para una nueva partida
	 */
	def iniciarNuevaPartida() {
	 	
		juego = new Juego(repositorio.mapa, repositorio.expediente)
		juego.crearCaso
		
		repo.lugaresPistas = juego.paisActual.lugares
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


	

}
