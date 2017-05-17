package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

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