package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Juego

@Transactional
@Observable
@Accessors
class MenuDeAccionesAppModel {
	
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo) {
		this.repo = repo
	}
	
	def iniciarNuevaPartida() {
	 	
		repo.juego = new Juego(repo.mapa, repo.expediente)
		repo.juego.crearCaso
		
		repo.lugaresPistas = repo.juego.paisActual.lugares
	 }
	 
	 def getPathImagenIntro() {
		"intro.jpg"
	}	
}