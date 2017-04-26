package appModel

import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Villano
import java.util.List
import carmenSanDiego.Sexo
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class EditarVillanoAppModel {
	
	CarmenSanDiegoRepo repo //el del dummy
	Villano villanoTemp
	String hobbieSeleccionado
	String senaSeleccionada
	List<Sexo> gender = Sexo.values.toList
	
	new(CarmenSanDiegoRepo csdrepo, Villano temp){
		repo = csdrepo
			villanoTemp = temp
		//objetoDelRobo = repo.juego.caso.objeto   //no se que le pasa a eclipse
	}

	def esNuevoVillano() {
		var res = true
		for(Villano v : repo.expediente.villanos){
			if(v.nombre == villanoTemp.nombre)
				res = false
			}
		res
	}
	def agregarVillano() {
		repo.expediente.agregarVillano(villanoTemp)
			}
	
	def getPathImagenVillano(){
		"villano.png"
	}



}


	

