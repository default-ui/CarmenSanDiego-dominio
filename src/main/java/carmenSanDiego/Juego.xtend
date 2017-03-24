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
	@Accessors Caso caso

	new(Mapamundi mapa, Expediente expediente, Caso caso) {
		this.mapa = mapa
		this.expediente = expediente
		this.paisActual = null
		this.paisesVisitados = newArrayList()
		this.caso = crearCaso()
	}

	def Caso crearCaso() {
		val Pais paisDelRobo = obtenerPaisDelRobo()
		this.paisActual = paisDelRobo
		new Caso(obtenerVillano(),
			obtenerObjeto(),
			obtenerPlanDeEscape(paisDelRobo),
			paisDelRobo)
	}
	/*
	 * Obtiene un objeto random de la lista de objetos predeterminados.
	 */
	def obtenerObjeto() {
		val objRepList = getListFromFile("src/main/resources/dataObjetos.csv")
		return objRepList.get(new Random().nextInt(objRepList.size()))
	}
	/*
	 * Obtiene un villano random de la lista de villanos
	 */
	def obtenerVillano() {
		this.expediente.obtenerVillano()
	}

	/*
	 * Obtiene un pais random a partir del mapamundi generado aleatoriamente
	 */
	def obtenerPaisDelRobo() {
		this.mapa.obtenerPaisDelRobo()
	}
	
	/*
	 * Crea elplan de escape. Este consiste en 5 paises conectados 
	 */
	def ArrayList<Pais> obtenerPlanDeEscape(Pais pais) {
		val plan = <Pais>newArrayList()
		val estadoInf = new EstadoInformante
		val estadoVil = new EstadoVillano
		plan.add(pais)
		for (i:0..<5){
			plan.add(plan.get(i).obtenerConexionSinRepetidos(plan))
			plan.get(i).setEstadoOcupante(estadoInf)
		}
		plan.remove(plan.indexOf(pais))
		plan.get(4).setEstadoOcupante(estadoVil)
		return plan
	
	}
	
	def pedirPista(Lugar lugar, Villano villano, Pais destino){
		paisActual.pedirPistaOcupante(lugar, villano, destino)
	}
	
	def viajar(Pais destino){
		this.paisesVisitados.add(paisActual)
		this.paisActual = destino
	}
	
	
}
