package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Villano
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class EditarCaracteristicaVillanoAppModel {
		
	CarmenSanDiegoRepo repo
	String inputValue	//for textboxs
	String senaSeleccionada
	String hobbieSeleccionado
	Villano villanoTemp
	
	new(CarmenSanDiegoRepo csdrepo, Villano vil){
		repo = csdrepo
		villanoTemp = vil
		//objetoDelRobo = repo.juego.caso.objeto   //no se que le pasa a eclipse
	}
	
	def eliminarSena(){
	 	villanoTemp.eliminarSena(senaSeleccionada)
	 	//villanoSenaSeleccionada = null
	 }
	
	def agregarSena(){
			villanoTemp.agregarSena(inputValue)
			inputValue = null
	}
	
		def eliminarHobbie(){
		villanoTemp.eliminarHobbie(hobbieSeleccionado)
	}
	
	def agregarHobbie(){
		villanoTemp.agregarHobbie(inputValue)
		inputValue = null
	}
	
		def getPathImagenSenas(){
		"senas.png"
	}
	
	def getPathImagenHobbies(){
		"hobbies.png"
	}
	
}
