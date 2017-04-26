package carmenSanDiego

import java.util.List
import utils.DummyData
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
	String nuevoPaisNombre
}