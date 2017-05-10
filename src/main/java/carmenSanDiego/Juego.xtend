package carmenSanDiego

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random
import static utils.FileParser.*
import java.util.ArrayList

@Observable
@Accessors
class Juego {

	Mapamundi mapa
	Expediente expediente
	Pais paisActual = null
	Pais paisDestino = null
	List<Pais> paisesVisitados = null
	List<Pais> recorrido = new ArrayList()
	List<Pais> fallidos = new ArrayList() 
	Caso caso = null
	OrdenDeArresto ordenDeArresto
	Random randomGen = new Random()
	Pais paisAnterior = null

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
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
		val planDeEscape = obtenerPlanDeEscape(pais)
		paisActual = pais
		val caso = new Caso(villano, objeto, planDeEscape, pais)
		for (i:0..<5){
		System.out.println(planDeEscape.get(i).nombre+">>> ")
		}
		this.caso = caso
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
		planDeEscape.get(4).setearEscondite()
		
		
		
		// el ultimo pais de la lista es aquel en el cual va a encontrarse el villano
		//paisActual.setEstadoOcupante(estadoVillano)
		planDeEscape.get(4).setEstadoOcupante(estadoVillano)
		

		planDeEscape

	}

	
	
	def pedirPista(Lugar lugar){
		paisActual.pedirPistaOcupante(lugar, this.caso.responsable, this.proximoPais, this.ordenDeArresto)
	}
	
	/**
	 * Viaja a un pais que debera estar entre las conexiones del pais
	 * actual, agrega el pais de despegue a los visitados, pone como
	 * actual el pais de destino
	 */
	def viajar(Pais destino){
		this.paisesVisitados.add(paisActual)
		this.paisAnterior=paisActual
		getRecorrido()
		getFallidos()
		this.paisActual = destino
	}
	
	def getOrdenDeArrestoString() {
		if (ordenDeArresto == null) {
			return '<Nadie>'
		}
		ordenDeArresto.villano.nombre		
	}
	
	def getRecorrido(){
		var recorrido = new ArrayList()
		recorrido.add(caso.paisDelRobo)
		for (Pais p: paisesVisitados){
			if (caso.planDeEscape.contains(p) && !recorrido.contains(p)){
				recorrido.add(p)
			}
		}
		this.recorrido=recorrido
	}
	
	def getFallidos(){
		var fallidos = new ArrayList()
		for (Pais p: paisesVisitados){
			if (!caso.planDeEscape.contains(p) && p!=caso.paisDelRobo && !fallidos.contains(p)){
				fallidos.add(p)
			}
		}
		this.fallidos=fallidos
	}
	
	def Pais getProximoPais(){
		var Pais proximo = null
		if (paisActual.nombre == caso.paisDelRobo.nombre){
			proximo = caso.planDeEscape.get(0)
		} else if (paisActual.nombre == caso.planDeEscape.get(4).nombre){
			proximo = caso.planDeEscape.get(0)
		}
		else{
			proximo = caso.planDeEscape.get(caso.planDeEscape.indexOf(paisActual)+1)
		}
		proximo
	}
	
	def emitirOrdenDeArresto(Villano villano) {
		this.ordenDeArresto = new OrdenDeArresto(villano)
	}
	
	def getPais(String paisId) {
		this.mapa.paises.findFirst[it.nombre == paisId]
	}
	
}
