package carmenSanDiego

class Juego {
	Mapamundi mapa
	Expediente expediente
	
	new (Mapamundi mapa, Expediente expediente){
		this.mapa = mapa
		this.expediente = expediente
	}
	
	def Caso crearCaso(){
		val Pais paisDelRobo = obtenerPaisDelRobo()
		val planDeEscape = obtenerConexiones(paisDelRobo)
		val responsable = obtenerVillano()
		return new(responsable, paisDelRobo.reporte, planDeEscape, paisDelRobo.objeto, Pais paisDelRobo)
	}	
	
	def obtenerVillano(){
		this.expediente.obtenerVillano()
	}
	
	def obtenerPaisDelRobo(){
		this.mapa.obtenerPaisDelRobo()
	}
}