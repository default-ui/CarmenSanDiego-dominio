package carmenSanDiego

import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static utils.FileParser.*
import java.util.ArrayList

@Observable
@Accessors
class Juego {

	Mapamundi mapa
	Expediente expediente
	Pais paisActual
	List<Pais> paisesVisitados
	List<Pais> recorrido = new ArrayList()
	List<Pais> fallidos = new ArrayList() 
	Caso caso
	OrdenDeArresto ordenDeArresto
	Random randomGen = new Random()

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
		this.paisActual = null
		this.paisesVisitados = newArrayList()
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
		this.caso = new Caso(villano, objeto, plan, pais)
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
		planDeEscape.add(paisDelRobo)
		var Pais paisSiguiente
		for(i : 0 ..< 5) {
			paisActual.estadoOcupante = estadoInformante
			
			paisSiguiente = paisActual.obtenerConexionSinRepetidos(planDeEscape)
			planDeEscape.add(paisSiguiente)
			
			paisActual = paisSiguiente
		}
		planDeEscape.remove(paisDelRobo)
		
		
		// el ultimo pais de la lista es aquel en el cual va a encontrarse el villano
		paisActual.setEstadoOcupante(estadoVillano)
		setearLugarDeLosHechos(paisActual)

		planDeEscape

	}

	/**
	 * Se le setea a un lugar random del ultimo pais del plan de escape que efectivamente el criminal
	 * responsable del hecho se encuentra en ese lugar
	 */
	def setearLugarDeLosHechos(Pais paisDelArresto) {
		
		val lugarDelArresto = paisDelArresto.lugares.get(randomGen.nextInt(paisDelArresto.lugares.size)) 
		lugarDelArresto.seEncuentraVillano = true
		
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
	
	def getOrdenDeArrestoString() {

		var res = '<Nadie>'
		if (ordenDeArresto !== null) {
			res = ordenDeArresto.villano.nombre
		}
		res
		
	}
	
	def getRecorrido(){
		var recorrido = new ArrayList()
		recorrido.add(caso.paisDelRobo)
		for (Pais p: paisesVisitados){
			if (caso.planDeEscape.contains(p)){
				recorrido.add(p)
			}
		}
		this.recorrido=recorrido
	}
	
	def getFallidos(){
		var fallidos = new ArrayList()
		for (Pais p: paisesVisitados){
			if (!caso.planDeEscape.contains(p) && p!=caso.paisDelRobo){
				fallidos.add(p)
			}
		}
		this.fallidos=fallidos
	}

}
