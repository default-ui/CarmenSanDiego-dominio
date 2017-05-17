package miniModel

import java.util.List
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.Mapamundi

@Accessors
class MiniMapamundi {
	List<MiniPais> mapa
	List<MiniPaisConConexiones> mapaConexiones

	new(Mapamundi mapa) {
		this.mapaConexiones = reducirPaisesConConexiones(mapa.paises)
  		this.mapa = reducirPaises(mapa.paises)
  	}
  	
	//TODO: codigo repetido de estadoJuego ARREGLARLOOOO
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
		for(p : mapaConexiones) {
        	if(p.nombre.equals(nombre)) {
        		return p
			}
		}
	}
	
	def eliminarPaisMapamundi(String id) {
		this.mapa.removeIf[ it.nombre == id ]
		this.mapaConexiones.removeIf[ it.nombre == id ]
	}

}