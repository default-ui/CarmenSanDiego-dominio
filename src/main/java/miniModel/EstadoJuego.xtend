package miniModel

import carmenSanDiego.Juego
import java.util.List
import carmenSanDiego.Pais
import carmenSanDiego.Lugar
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class EstadoJuego {
	
	List<Lugar> lugares
	List<MiniPais> recorrido
	List<MiniPais> paisesFallidos
	List<MiniPais> viajesPosibles
	List<MiniPais> mapamundi
	List<MiniPaisConConexiones> mapamundiConexiones
	
	
	
	new(Juego juego){
		this.recorrido = reducirPaises(juego.getRecorrido)
		this.paisesFallidos = reducirPaises(juego.getFallidos)
		this.viajesPosibles = reducirPaises(juego.paisActual.conexiones)
		this.lugares = juego.paisActual.lugares
		this.mapamundi = reducirPaises(juego.mapa.paises)
		this.mapamundiConexiones = reducirPaisesConConexiones(juego.mapa.paises)
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