package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import utils.DummyData

/**
 * AppModel del juego
 */
@Observable
@Accessors
class CarmenSanDiegoAppModel {
	Mapamundi mapa = DummyData.crearMapamundiDummy()
		
	Pais paisSeleccionado
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	def getPathImagenIntro() {
		"intro.jpg"
	}	
	
}
