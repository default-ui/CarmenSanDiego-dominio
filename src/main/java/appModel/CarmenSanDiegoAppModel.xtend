package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import utils.DummyData
import carmenSanDiego.Juego
import carmenSanDiego.Expediente

/**
 * AppModel del juego
 */
@Observable
@Accessors
class CarmenSanDiegoAppModel {
	
	Mapamundi mapa = DummyData.crearMapamundiDummy
	Expediente expediente = DummyData.crearExpedienteDummy
	
	// TODO GIGANTE, muuchisimo, sino todos los campos de juego deberian mudarse a esta clase
	Juego juego = new Juego(mapa, expediente)
	
	Pais paisSeleccionado
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	def getPathImagenIntro() {
		"intro.jpg"
	}	
	
}
