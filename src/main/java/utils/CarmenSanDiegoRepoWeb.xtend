package utils

import java.util.List
import carmenSanDiego.Lugar
import carmenSanDiego.Mapamundi
import carmenSanDiego.Expediente
import carmenSanDiego.Pais
import carmenSanDiego.Juego
import java.util.Map
import carmenSanDiego.Villano
import java.util.ArrayList
import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarmenSanDiegoRepoWeb {
	List<Lugar> lugares = DummyData.crearArrayDeLugaresPosibles
	Mapamundi mapa = DummyData.crearMapamundiDummy
	Expediente expediente = DummyData.crearExpedienteDummy
	Pais paisTemp
	Map<String, String> pistas = new HashMap<String, String>()
	Villano villanoDeNuevaOrdenDeArresto
	List<Lugar> lugaresPistas = new ArrayList<Lugar>
	Lugar lugar1
	Lugar lugar2
	Lugar lugar3
	String nuevoPaisNombre
	Integer juegoID = 1
	List<Juego> partidas = new ArrayList<Juego>
	
	def actualizarJuego(Juego juego) {
		juego.crearCaso
		partidas.add(juego)
		juegoID++
	}
	
	def getCaso(Integer id) {
		for(partida : partidas){
			if(partida.id.equals(id)){
				return partida
			}
		}
	}
	
	def getNextIdVillano(){
		expediente.villanos.maxBy[id].id + 1		
		
	}
	
	def getNextIdPais(){
		mapa.paises.maxBy[id].id + 1
	}
	
	}