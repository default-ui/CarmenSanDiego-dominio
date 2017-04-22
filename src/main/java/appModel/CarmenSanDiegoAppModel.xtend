package appModel

import carmenSanDiego.Expediente
import carmenSanDiego.Juego
import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import carmenSanDiego.Villano
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import utils.DummyData
import carmenSanDiego.Sexo

/**
 * AppModel del juego
 */
@Observable
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
	String inputValue	//for textboxs
	Villano villanoTemp
	String villanoNombre
	String villanoCaracSeleccionada
	List<Sexo> gender = Sexo.values.toList
	String selectedGender
	
	/************
	 * Mapamundi *
	 ************/
	
	def agregarPais(){
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
	
	/************
	 * Villanos *
	 ************/
	 
	 def eliminarSena(){
	 	villanoTemp.eliminarSena(villanoCaracSeleccionada)
	 	villanoCaracSeleccionada = null
	 }
	
	def agregarSena(){
			villanoTemp.agregarSena(inputValue)
			inputValue = null
	}
	
	def eliminarHobbie(){
		villanoTemp.eliminarHobbie(villanoCaracSeleccionada)
	}
	
	def agregarHobbie(){
		villanoTemp.agregarHobbie(inputValue)
		inputValue = null
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
	
	def getPathImagenSenas(){
		"senas.png"
	}
	
	def getPathImagenHobbies(){
		"hobbies.png"
	}

}
