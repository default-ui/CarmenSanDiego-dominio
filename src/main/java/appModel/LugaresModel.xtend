package appModel

import carmenSanDiego.Lugar
import carmenSanDiego.Caso
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Expediente
import carmenSanDiego.Juego
import utils.DummyData

@Observable
@Accessors
class LugaresModel {
	Lugar lugar
	Caso caso
	Juego juego = crearJuego()
	
	
	def crearJuego(){
		val expediente = new Expediente() => [generarExpedienteAleatorio()]
		new Juego(DummyData.crearMapamundiDummy(), expediente)
	}
}