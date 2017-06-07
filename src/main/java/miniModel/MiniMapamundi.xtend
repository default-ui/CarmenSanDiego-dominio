 package miniModel

import java.util.List
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.Mapamundi
import carmenSanDiego.Lugar
import utils.DummyData
import java.util.ArrayList
import java.util.Arrays

@Accessors
class MiniMapamundi {
	List<MiniPaisConConxYCarac> mapa = new ArrayList<MiniPaisConConxYCarac>
	List<MiniPaisConConxYCarac> mapaConexiones = new ArrayList<MiniPaisConConxYCarac>
	List<Lugar> lugaresPosibles = DummyData.crearArrayDeLugaresPosibles
	List<String> lugaresNombres = new ArrayList<String>(Arrays.asList("Banco", "Club", "Biblioteca","Embajada"))
	List<MiniPaisConConxYCarac> mapaNuevo
	MiniPaisConConxYCarac paisNuevo2
	MiniPaisConConxYCarac paisNuevo
	List<Lugar> vacia
	List<String> lugaresNuevo
	
	Pais paisNuevito

	new(Mapamundi mapa) {
		this.reducirPaisesConConexiones(mapa.paises)
  		this.reducirPaises(mapa.paises)
  	}
  	
	//TODO: codigo repetido de estadoJuego ARREGLARLOOOO
	def reducirPaises(List<Pais> paises){
		for(p:paises){
			this.mapa.add(toMiniPais(p))
		}
	}
	
	def reducirPaisesConConexiones(List<Pais> paises){
		for(p:paises){
			this.mapaConexiones.add(toMiniPais(p))
		}
	}
	
	def toMiniPais(Pais pais) {
		new MiniPaisConConxYCarac(pais)
	}
	
	def toMiniPaisConConexiones(Pais pais) {
		new MiniPaisConConxYCarac(pais)
	}
	
	def getPaisById(Integer id){
		if (id==0){
			paisNuevito = new Pais()
			paisNuevito.id = mapaConexiones.size()+1
			return toMiniPais(paisNuevito)
		} else {
			for(p : mapaConexiones) {
        		if(p.id.equals(id)) {
        			return p
				}
			}
		}
	}
	
	def setId(Object object, int i) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def getLugaresPosibles(Integer id){
		if (id==0){
			return lugaresNombres
		} else {
			this.paisNuevo2 = getPaisById(id)
			this.lugaresNuevo = this.lugaresNombres
			if (paisNuevo2.lugares.size()==3){
				return vacia
			}else{
				for (p : paisNuevo2.lugares){
					lugaresNuevo.removeIf[it == p]
			}
			return lugaresNuevo
			}
		}
		
	}
	
	def getConexionesPosibles(Integer id){
		this.paisNuevo = getPaisById(id)
		this.mapaNuevo = this.mapa
		for (p : paisNuevo.conexiones){
			mapaNuevo.removeIf[ it.nombre == p.nombre]
		}
		mapaNuevo.removeIf[ it.nombre == paisNuevo.nombre]
		return mapaNuevo
	}
	
	def eliminarPaisMapamundi(String id) {
		this.mapa.removeIf[ it.nombre == id ]
		this.mapaConexiones.removeIf[ it.nombre == id ]
	}
	
	def getArrayNombresLugares() {
		lugaresNombres = new ArrayList
		for (l : lugaresPosibles){
			lugaresNombres.add(l.nombre)
		}
		return lugaresNombres
	}

}