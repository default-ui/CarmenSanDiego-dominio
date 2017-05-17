package carmenSanDiego

import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*

import static org.junit.Assert.*
import java.util.Random

class ExpedienteTest {
	
	Expediente expedienteAleatorio
	Expediente expediente
	Random randomMock
	
	
	@Before def void setUp(){
		expedienteAleatorio = new Expediente
		expediente =  new Expediente
		expediente.nuevoVillano(1, "El Gato", Sexo.Masculino)
		randomMock = mock(Random)
	}
	
	@Test 
	def void generarExpedienteAleatorio(){
		
		expedienteAleatorio.generarExpedienteAleatorio()
		
		assertEquals(expedienteAleatorio.villanos.size, 5)
	}

	@Test 
	def void crearVillano(){
		
		assertFalse(expediente.villanos.isEmpty)
		assertEquals("El Gato", expediente.villanos.get(0).nombre)
		assertEquals(Sexo.Masculino, expediente.villanos.get(0).sexo)
	}
	
	@Test 
	def void eliminarVillano(){
		
		assertFalse(expediente.villanos.isEmpty)
		
		expediente.eliminarVillano("El Gato")
		assertTrue(expediente.villanos.isEmpty)
	}

	@Test
	def void obtenerVillano(){
		when(randomMock.nextInt).thenReturn(0)
		
		assertEquals(expediente.obtenerVillano.nombre, "El Gato")
	}
}