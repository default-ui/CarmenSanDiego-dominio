package carmenSanDiego

import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class JuegoTest {
	
	Juego juego
	Mapamundi mapa
	Expediente expediente
	
	@Before
	def void init() {
		mapa = new Mapamundi
		mapa.generarMapamundiAleatorio()
		expediente = new Expediente
		juego = new Juego(mapa,expediente)
	}


	
	@Test def obtenerPlanDeEscapeParaCaso(){
		val pais = this.juego.mapa.paises.get(1)
		val paises = juego.obtenerPlanDeEscape(pais)
		assertEquals(paises.size,5)
		for(i:0..<5){
			System.out.println(paises.get(i).nombre)
			}
		}
	}
