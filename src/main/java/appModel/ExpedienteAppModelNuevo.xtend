package appModel

import org.uqbar.commons.utils.Observable
import carmenSanDiego.Expediente
import carmenSanDiego.Villano
import carmenSanDiego.CarmenSanDiegoRepo
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class ExpedienteAppModelNuevo {
	
	CarmenSanDiegoRepo repo //el del dummy
	String objetoDelRobo
	Villano villanoTemp
	String hobbieSeleccionado
	String senaSeleccionada
	
	new(CarmenSanDiegoRepo csdrepo){
		repo = csdrepo

		//objetoDelRobo = repo.juego.caso.objeto   //no se que le pasa a eclipse
	}
	
	def crearNuevoVillano() {
		villanoTemp = new Villano("")
	}
	

}