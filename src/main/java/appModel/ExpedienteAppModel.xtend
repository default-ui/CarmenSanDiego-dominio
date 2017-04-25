package appModel

import carmenSanDiego.Expediente
import utils.DummyData
import carmenSanDiego.Villano
import java.util.List
import carmenSanDiego.Sexo
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Transactional
@Accessors
class ExpedienteAppModel {
	
	Expediente expediente = DummyData.crearExpedienteDummy
	
	String inputValue	//for textboxs
	Villano villanoTemp = null
	String villanoNombre
	String villanoCaracSeleccionada
	List<Sexo> gender = Sexo.values.toList
	String selectedGender
	String objeto
	
	/************
	 * Villanos *
	 ************/
	 
	 // TODO fijarse eso de que cuando no hay nada seleccionado no puedo editar en la ventana que se abre
	 
	def eliminarSena(){
	 	villanoTemp.eliminarSena(villanoCaracSeleccionada)
	 	villanoCaracSeleccionada = null
	 }
	
	def agregarSena(){
			villanoTemp.agregarSena(inputValue)
			inputValue = null
	}
	
	def eliminarHobbie(){
		villanoTemp.eliminarHobbie(villanoCaracSeleccionada)
	}
	
	def agregarHobbie(){
		villanoTemp.agregarHobbie(inputValue)
		inputValue = null
	}
	
	def agregarVillano() {
		expediente.agregarVillano(villanoTemp)
			}
			
	def esNuevoVillano() {
		var res = true
		for(Villano v : expediente.villanos){
			if(v.nombre == villanoTemp.nombre)
				res = false
			}
		res
	}
	
		
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenExpediente() {
		"expediente.png"
	}
	
	
	def getPathImagenSenas(){
		"senas.png"
	}
	
	def getPathImagenHobbies(){
		"hobbies.png"
	}
	
	def getPathImagenVillano(){
		"villano.png"
	}
	
}