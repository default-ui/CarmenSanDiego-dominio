package miniModel

import carmenSanDiego.Juego
import java.util.List
import carmenSanDiego.Pais
import carmenSanDiego.Lugar

class EstadoJuego {
	
	List<Lugar> lugares
	List<MiniPais> recorrido
	List<MiniPais> paisesFallidos
	List<MiniPais> viajesPosibles
	
	new(Juego juego){
		this.recorrido = reducirPaises(juego.getRecorrido)
		this.paisesFallidos = reducirPaises(juego.getFallidos)
		this.viajesPosibles = reducirPaises(juego.paisActual.conexiones)
		this.lugares = juego.paisActual.lugares
	}
	
	def reducirPaises(List<Pais> paises) {
		paises.map([it.toMiniPais])
	}
	
	def toMiniPais(Pais pais) {
		new MiniPais(pais)
	}
	
}