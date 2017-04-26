package appModel

import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import utils.DummyData
import java.util.List

@Observable
@Transactional
@Accessors
class MapamundiAppModel {
	
	Mapamundi mapa
	
	
	String nuevoPaisNombre
	
	
	Lugar lugarAEliminar
	Lugar lugar
	Pais paisSeleccionado
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	
	new(Mapamundi map){
		mapa = map
		paisSeleccionado = mapa.paises.get(0)
	}
	
	/************
	 * Mapamundi *
	 ************/
	
	
	
	
	
	
	
	
	
	
	
	
	/************
	 * Imagenes *
	 ************/
	
	def getPathImagenMapamundi() {
		"mapamundi.png"
	}
	
	def getPathImagenNuevoPais(){
		"nuevo_pais.png"
	}
	
	
	
	def getPathImagenConexiones(){
		"conexiones.png"
	}
	
	def getPathImagenLugares(){
		"lugares.png"
	}
	
}