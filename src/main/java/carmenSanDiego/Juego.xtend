package carmenSanDiego

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import static utils.FileParser.*
import java.util.Random


class Juego {

	@Accessors Mapamundi mapa
	@Accessors Expediente expediente
	@Accessors Pais paisActual
	@Accessors ArrayList<Pais> paisesVisitados

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
		this.paisActual = null
		this.paisesVisitados = newArrayList()
	}

	def Caso crearCaso() {
		val Pais paisDelRobo = obtenerPaisDelRobo()
		this.paisActual = paisDelRobo
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
	
	def pedirPista(Lugar lugar, Villano villano, Pais destino){
		paisActual.pedirPista(lugar, villano, destino)
	}
	
	def viajar(Pais destino){
		this.paisesVisitados.add(paisActual)
		this.paisActual = destino
	}
	
	
}
