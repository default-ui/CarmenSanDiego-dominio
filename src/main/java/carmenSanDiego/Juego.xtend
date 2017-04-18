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
		
		val villano = obtenerVillano()
		val objeto = obtenerObjeto()
		val pais = obtenerPaisDelRobo()
		val plan = obtenerPlanDeEscape(pais)
		
		this.paisActual = pais
		
		new Caso(villano, objeto, plan, pais)
	}

	/**
	 * Obtiene un objeto random de la lista de objetos predeterminados.
	 */
	def obtenerObjeto() {
		val listadoObjetos = getListFromFile("/dataObjetos.csv")
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
	 * NO incluye al pais del robo 
	 */
	def obtenerPlanDeEscape(Pais paisDelRobo) {
		
		val planDeEscape = <Pais>newArrayList()
		val estadoInformante = new EstadoInformante
		val estadoVillano = new EstadoVillano
		
		// agrego un pais siguiente (entre las conexiones del actual)
		// despues paso al siguiente como actual
		var paisActual = paisDelRobo
		var Pais paisSiguiente
		for(i : 0 ..< 5) {
			paisActual.estadoOcupante = estadoInformante
			
			paisSiguiente = paisActual.obtenerConexionSinRepetidos(planDeEscape)
			planDeEscape.add(paisSiguiente)
			
			paisActual = paisSiguiente
		}
		
		
		// el ultimo pais de la lista es aquel en el cual va a encontrarse el villano
		paisActual.setEstadoOcupante(estadoVillano)
		setearLugarDeLosHechos(paisActual)

		planDeEscape

	}
<<<<<<< HEAD
=======

>>>>>>> 3f7b2effc7dbcd9304db8723a453a71ee4bfd420
	/**
	 * Se le setea a un lugar random del ultimo pais del plan de escape que efectivamente el criminal
	 * responsable del hecho se encuentra en ese lugar
	 */
	def setearLugarDeLosHechos(Pais paisDelArresto) {
		
		val lugarDelArresto = paisDelArresto.lugares.get(randomGen.nextInt(paisDelArresto.lugares.size)) 
		lugarDelArresto.seEncuentraVillano = true
		
	}
<<<<<<< HEAD
	
	
	def pedirPista(Lugar lugar, Villano villano, Pais destino, OrdenDeArresto ordenDeArresto){
		paisActual.pedirPistaOcupante(lugar, villano, destino, ordenDeArresto)
	}
	
	/**
	 * Viaja a un pais que debera estar entre las conexiones del pais
	 * actual, agrega el pais de despegue a los visitados, pone como
	 * actual el pais de destino
	 */
	def viajar(Pais destino){
=======

	def pedirPista(Lugar lugar, Villano villano, Pais destino, OrdenDeArresto ordenDeArresto) {
		paisActual.pedirPistaOcupante(lugar, villano, destino, ordenDeArresto)
	}

	def viajar(Pais destino) {
>>>>>>> 3f7b2effc7dbcd9304db8723a453a71ee4bfd420
		this.paisesVisitados.add(paisActual)
		this.paisActual = destino
	}

}
