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
	@Accessors OrdenDeArresto ordenDeArresto
	@Accessors Random randomGen = new Random()

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
		this.paisActual = null
		this.paisesVisitados = newArrayList()
		this.caso = crearCaso()
		this.ordenDeArresto = null
	}

	/**
	 * Crea un caso a partir del juego recien iniciado.
	 */
	def Caso crearCaso() {
		val Pais paisDelRobo = obtenerPaisDelRobo()
		this.paisActual = paisDelRobo
		new Caso(obtenerVillano(),
			obtenerObjeto(),
			obtenerPlanDeEscape(paisDelRobo),
			paisDelRobo)
	}
	/**
	 * Obtiene un objeto random de la lista de objetos predeterminados.
	 */
	def obtenerObjeto() {
		val listadoObjetos = getListFromFile("src/main/resources/dataObjetos.csv")
		return listadoObjetos.get(randomGen.nextInt(listadoObjetos.size()))
	}
	/**
	 * Obtiene un villano random de la lista de villanos
	 */
	def obtenerVillano() {
		this.expediente.obtenerVillano()
	}

	/**
	 * Obtiene un pais random a partir del mapamundi generado aleatoriamente
	 */
	def obtenerPaisDelRobo() {
		this.mapa.obtenerPaisDelRobo()
	}
	
	/**
	 * Crea el plan de escape a partir de un pais (el del robo). 
	 * Este consiste en 5 paises conectados elegidos al azar. 
	 */
	def ArrayList<Pais> obtenerPlanDeEscape(Pais pais) {
		val plan = <Pais>newArrayList()
		val estadoInformante = new EstadoInformante
		val estadoVillano = new EstadoVillano
		plan.add(pais)
		for (i:0..<5){
			plan.add(plan.get(i).obtenerConexionSinRepetidos(plan))
			plan.get(i).setEstadoOcupante(estadoInformante)
		}
		// el ultimo pais de la lista es aquel en el cual va a encontrarse el villano
		plan.remove(plan.indexOf(pais))
		plan.get(4).setEstadoOcupante(estadoVillano)
		setearLugarDeLosHechos(plan.get(4), randomGen.nextInt(3))
		
		return plan
	
	}
	/**
	 * Se le setea a un lugar random del ultimo pais del plan de escape que efectivamente el criminal
	 * responsable del hecho se encuentra en ese lugar
	 */
	def setearLugarDeLosHechos(Pais paisDelArresto, int random) {
		paisDelArresto.lugares.get(random).seEncuentraVillano = true
	}
	
	
	def pedirPista(Lugar lugar, Villano villano, Pais destino, OrdenDeArresto ordenDeArresto){
		paisActual.pedirPistaOcupante(lugar, villano, destino, ordenDeArresto)
	}
	
	/**
	 * Viaja a un pais que debera estar entre las conexiones del pais
	 * actual, agrega el pais de despegue a los visitados, pone como
	 * actual el pais de destino
	 */
	def viajar(Pais destino){
		this.paisesVisitados.add(paisActual)
		this.paisActual = destino
	}
	
	
}
