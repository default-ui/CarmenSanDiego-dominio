package miniModel

import carmenSanDiego.Juego
import carmenSanDiego.Pais
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EstadoJuego {
	
	Integer id
	MiniPais pais
	List<MiniPais> recorrido
	List<MiniPais> paisesFallidos
	
	new(Juego juego) {
		this.id = juego.id
		this.recorrido = juego.getRecorrido.reducirPaises
		this.paisesFallidos = juego.getFallidos.reducirPaises
		this.pais = juego.paisActual.toMiniPais
	}
	
	def reducirPaises(List<Pais> paises) {
		paises.map([it.toMiniPais])
	}
	
	
	def toMiniPais(Pais pais) {
		new MiniPais(pais)
	}
	
}