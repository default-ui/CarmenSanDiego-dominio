package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class EditarHobbieAppModel {
	
	CarmenSanDiegoRepo repo
	String inputValue	//for textboxs
	String hobbieSeleccionado
	Villano villanoTemp
	
	new(CarmenSanDiegoRepo csdrepo){
		repo = csdrepo
		//objetoDelRobo = repo.juego.caso.objeto   //no se que le pasa a eclipse
	}
	
	def eliminarHobbie(){
		villanoTemp.eliminarHobbie(hobbieSeleccionado)
	}
	
	def agregarHobbie(){
		villanoTemp.agregarHobbie(inputValue)
		inputValue = null
	}
}