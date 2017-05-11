package miniModel

import carmenSanDiego.Juego
import java.util.List
import carmenSanDiego.Pais
import carmenSanDiego.Lugar
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class EstadoJuego {
	
	MiniPais pais
	List<MiniPais> recorrido
	List<MiniPais> paisesFallidos
	List<MiniPais> mapamundi
	List<MiniPaisConConexiones> mapamundiConexiones
	
	new(Juego juego) {
		this.recorrido = juego.getRecorrido.reducirPaises
		this.paisesFallidos = juego.getFallidos.reducirPaises
		this.pais = juego.paisActual.toMiniPais
    this.mapamundiConexiones = reducirPaisesConConexiones(juego.mapa.paises)
    this.mapamundi = reducirPaises(juego.mapa.paises)
  }
	
	def reducirPaises(List<Pais> paises) {
		paises.map([it.toMiniPais])
	}
	
		def reducirPaisesConConexiones(List<Pais> paises) {
		paises.map([it.toMiniPaisConConexiones])
	}
	
	def toMiniPais(Pais pais) {
		new MiniPais(pais)
	}
	
	def toMiniPaisConConexiones(Pais pais) {
		new MiniPaisConConexiones(pais)
	}
	
	def getPaisById(String nombre){
		for(p : mapamundiConexiones) {
        	if(p.nombre.equals(nombre)) {
            	return p
			}
		}
	}
	
}