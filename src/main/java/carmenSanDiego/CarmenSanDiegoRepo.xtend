package carmenSanDiego

import java.util.List
import utils.DummyData
import java.util.Map
import java.util.HashMap
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Transactional
@Accessors
class CarmenSanDiegoRepo {
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	Mapamundi mapa = DummyData.crearMapamundiDummy
	Expediente expediente = DummyData.crearExpedienteDummy
	Pais paisTemp
	Juego juego
	Map<String, String> pistas = new HashMap<String, String>()
	Villano villanoDeNuevaOrdenDeArresto
	List<Lugar> lugaresPistas = new ArrayList<Lugar>
	String nuevoPaisNombre
}