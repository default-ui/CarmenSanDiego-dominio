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
import org.uqbar.commons.utils.Transactional

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
	String caracteristica
	String caracteristicaAEliminar
	String nuevoPaisNombre	
	Pais paisSeleccionado = mapa.paises.get(0)
	Villano villanoDeNuevaOrdenDeArresto
	///
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
	 
	def pedirPista(){
		
		juego.pedirPista(
			lugarAbierto, 
			juego.caso.responsable,
			juego.proximoPais,
			juego.ordenDeArresto
		)
	 	
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
	
	



}
