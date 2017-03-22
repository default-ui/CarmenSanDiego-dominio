package carmenSanDiego

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import static utils.FileParser.*
import java.util.Random
import java.util.Arrays

class Juego {

	@Accessors Mapamundi mapa
	@Accessors Expediente expediente

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
	}

	def Caso crearCaso() {
		val Pais paisDelRobo = obtenerPaisDelRobo()
		new Caso(obtenerVillano(),
			obtenerObjeto(),
			obtenerPlanDeEscape(paisDelRobo),
			paisDelRobo)
	}
	
	def obtenerObjeto() {
		val objRepList = getListFromFile("src/main/resources/dataObjetos.csv")
		return objRepList.get(new Random().nextInt(objRepList.size()))
	}

	def obtenerVillano() {
		this.expediente.obtenerVillano()
	}

	def obtenerPaisDelRobo() {
		this.mapa.obtenerPaisDelRobo()
	}

	def ArrayList<Pais> obtenerPlanDeEscape(Pais pais) {
		val plan = <Pais>newArrayList()
		val estadoInf = new EstadoInformante
		val estadoVil = new EstadoVillano
		plan.add(pais)
		for (i:0..<5){
			plan.add(plan.get(i).obtenerConexionSinRepetidos(plan))
			plan.get(i).setEstado(estadoInf)
		}
		plan.remove(plan.indexOf(pais))
		plan.get(4).setEstado(estadoVil)
		return plan
	}
}
