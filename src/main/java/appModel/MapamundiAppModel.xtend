package appModel

import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional

@Observable
@Transactional
@Accessors
class MapamundiAppModel {
	
	Mapamundi mapa
	
	Pais temp
	String nuevoPaisNombre
	String caracteristica
	String caracteristicaAEliminar
	Pais conexionAEliminar
	Pais conexion
	Lugar lugarAEliminar
	Lugar lugar
	Pais paisSeleccionado
	
	new(Mapamundi map){
		mapa = map
		paisSeleccionado = mapa.paises.get(0)
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
	 * Imagenes *
	 ************/
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
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