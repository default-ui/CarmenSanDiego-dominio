package appModel

import carmenSanDiego.Expediente
import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import carmenSanDiego.Sexo
import carmenSanDiego.Villano
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import utils.DummyData
import java.util.ArrayList
import org.uqbar.commons.utils.Transactional
import org.uqbar.commons.utils.Transactional
import utils.DummyData

/**
 * AppModel del juego
 */
@Observable
@Transactional
@Accessors
class CarmenSanDiegoAppModel {
	
	Mapamundi mapa = DummyData.crearMapamundiDummy
	Expediente expediente = DummyData.crearExpedienteDummy
	Juego juego = new Juego(mapa, expediente)
	Pais pais
	Pais temp
	Pais conexionAEliminar
	Pais conexion
	Lugar lugarAEliminar
	Lugar lugar
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	List<Lugar> lugaresPistas = new ArrayList<Lugar>
	String caracteristica
	String caracteristicaAEliminar
	String nuevoPaisNombre	
	Pais paisSeleccionado = mapa.paises.get(0)
	Villano villanoDeNuevaOrdenDeArresto
	String pistasBanco
	String pistasBiblioteca
	String pistasClub
	String pistasEmbajada
	Lugar lugarAbierto
	/// Otro appModels
	ExpedienteAppModel expedienteAppModel = new ExpedienteAppModel
	
	new(){
		
	}
	
	
	/************
	 * Mapamundi *
	 ************/
	
	def agregarPais(){
		validarCantidadLugares(temp.lugares.size)
		temp.nombre = nuevoPaisNombre
		mapa.paises.add(temp)
	}
	
	def agregarCaracteristica(){
		temp.agregarCaracteristica(caracteristica)
	}
	
	def eliminarCaracteristica() {
		temp.eliminarCaracteristica(caracteristicaAEliminar)
	}
	
	def agregarConexion() {
		temp.agregarConexion(conexion)
	}
	
	def eliminarConexion() {
		temp.eliminarConexion(conexionAEliminar)
	}
	
	def agregarLugar() {
		temp.agregarLugar(lugar)
	}
	
	def eliminarLugar() {
		temp.eliminarLugar(lugarAEliminar)
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
	
	/************
	 * Lugares *
	 ************/
	 
	//def pedirPista(){
	//	
	//	juego.pedirPista(
	//		lugarAbierto, 
	//		juego.caso.responsable,
	//		juego.proximoPais,
	//		juego.ordenDeArresto
	//	)
	// 	
	//}
	
	def pedirPista(){
		var res = ""
		if (lugarAbierto.nombre=="Banco"){
			res = pistasBanco
		}
		if (lugarAbierto.nombre=="Biblioteca"){
			res = pistasBiblioteca
		}
		if (lugarAbierto.nombre=="Club"){
			res = pistasClub
		}
		if (lugarAbierto.nombre=="Embajada"){
			res = pistasEmbajada
		}
		res
	}
	
	
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	
	def getPathImagenIntro() {
		"intro.jpg"
	}	
	
	def getPathImagenNuevoPais(){
		"nuevo_pais.png"
	}
	
	def getPathImagenCaracteristicas(){
		"caracteristicas.png"
	}
	
	def getPathImagenConexiones(){
		"conexiones.png"
	}
	
	def getPathImagenLugares(){
		"lugares.png"
	}
	
	def traerPistasDeBanco(Pais pais, Villano villano){
		var res = "" 
		for (Lugar l: pais.lugares){
			if (l.nombre == "Banco"){
				res = l.obtenerPista(pais, villano) 
			}
		}
		pistasBanco=res
	}
	
	def traerPistasDeBiblioteca(Pais pais, Villano villano){
		var res = "" 
		for (Lugar l: pais.lugares){
			if (l.nombre == "Biblioteca"){
				res = l.obtenerPista(pais, villano) 
			}
		}
		pistasBiblioteca=res
	}
	
	def traerPistasDeClub(Pais pais, Villano villano){
		var res = "" 
		for (Lugar l: pais.lugares){
			if (l.nombre == "Club"){
				res = l.obtenerPista(pais, villano) 
			}
		}
		pistasClub=res
	}
	
	def traerPistasDeEmbajada(Pais pais, Villano villano){
		var res = "" 
		for (Lugar l: pais.lugares){
			if (l.nombre == "Embajada"){
				res = l.obtenerPista(pais, villano) 
			}
		}
		pistasEmbajada=res
		
	}
	
	def traerPistas(Pais pais, Villano villano){
		traerPistasDeBanco(pais, villano)
		traerPistasDeBiblioteca(pais, villano)
		traerPistasDeClub(pais, villano)
		traerPistasDeEmbajada(pais, villano)
	}


}
