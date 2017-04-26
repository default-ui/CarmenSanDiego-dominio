package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Lugar
import java.util.HashMap
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional

@Transactional
@Observable
@Accessors
class LugarAppModel {
	
	Lugar lugarAbierto
	Map<String, String> pistas = new HashMap<String, String>()
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo, Lugar lugarAbierto) {
		this.repo = repo
		this.lugarAbierto = lugarAbierto
	}
	
	def victoria(){
		var vict = #["Enhorabuena!!!", "Has detenido a " + repo.juego.ordenDeArresto.villano.nombre + " y recuperado " + repo.juego.caso.objeto, "Felicitaciones!!!" ]
		vict
	}
	
	def buttonVictoria() {
		"Disfrutar la victoria"
	}
	
	def buttonDerrota() {
		"Aceptar el error"
	}
	
	def derrotaPorVillanoIncorrecto(){
		var malasNot = #["Malas noticias :(", "Has detenido a " + repo.juego.caso.responsable.nombre + ".", "Tenias una orden de arresto contra: " 
			+ repo.villanoDeNuevaOrdenDeArresto.nombre + ".", "Lamentablemente este crimen quedara impune." 
		]
		malasNot
	}
	
	def derrotaPorNoOrdenDeArresto(){
		#["Malas noticias :(", "No contabas con una orden de arresto para detener al criminal.", "Lamentablemente este crimen quedara impune."]
	}
	
	def pistaActual() {
		pistas.get(lugarAbierto.nombre)
	}
	
	def villanoEquivocado() {
		!this.lugarAbierto.detenido && repo.juego.ordenDeArresto != null
	}
	
	def sinOrdenDeArresto() {
		repo.juego.ordenDeArresto == null
	}
	
	def objetoRobado() {
		repo.juego.caso.objeto
	}
}