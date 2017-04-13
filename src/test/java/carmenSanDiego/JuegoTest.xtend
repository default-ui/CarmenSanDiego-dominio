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
		mapa.generarMapamundiAleatorio
		
		expediente = new Expediente
		expediente.generarExpedienteAleatorio
		
		juego = new Juego(mapa,expediente)
	}
	
	@Test def obtenerPlanDeEscapeParaCaso(){
		
		val paisDelRobo = juego.obtenerPaisDelRobo
		val planDeEscape = juego.obtenerPlanDeEscape(paisDelRobo)

		assertEquals(planDeEscape.size,5)

		System.out.println("Pais Del Robo: " + paisDelRobo)				
		System.out.println("Plan de Escape:")
		for(p : planDeEscape){
			System.out.println(p)
		}

	}

}
