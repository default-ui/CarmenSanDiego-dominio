package miniModel

import carmenSanDiego.Juego
import carmenSanDiego.Pais
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EstadoJuego {
	
	MiniPais pais
	List<MiniPais> recorrido
	List<MiniPais> paisesFallidos
	//no necesito esto para el post de inicio de juego 
	//List<MiniPais> mapamundi
	//List<MiniPaisConConexiones> mapamundiConexiones
	
	new(Juego juego) {
		this.recorrido = juego.getRecorrido.reducirPaises
		this.paisesFallidos = juego.getFallidos.reducirPaises
		this.pais = juego.paisActual.toMiniPais
  //  this.mapamundiConexiones = reducirPaisesConConexiones(juego.mapa.paises)
  //  this.mapamundi = reducirPaises(juego.mapa.paises)
  }
	
	def reducirPaises(List<Pais> paises) {
		paises.map([it.toMiniPais])
	}
	
	
	def toMiniPais(Pais pais) {
		new MiniPais(pais)
	}
	
	
	
}