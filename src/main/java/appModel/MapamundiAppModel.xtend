package appModel


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import carmenSanDiego.Mapamundi
import carmenSanDiego.Pais

@Observable
@Accessors
class MapamundiAppModel {
	Mapamundi mapa
	Pais paisSeleccionado
	
	def getUbicacionesPosibles(){
	//	Arrays.asList(Ubicacion.values)
	//}
	
	//def nuevaNota() {
	//	var nota = new Nota
	//	materiaSeleccionada.agregarNota(nota)
	//	nota
	//}
	
	//def eliminarNota() {
	//	materiaSeleccionada.eliminarNota(notaSeleccionada)
	//}
	
	}
}
