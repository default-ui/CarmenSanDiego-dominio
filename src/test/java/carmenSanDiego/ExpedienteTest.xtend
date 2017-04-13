package carmenSanDiego

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class ExpedienteTest {
	
	Expediente expediente
	
	@Before def void setUp(){
		expediente = new Expediente
	}
	
	@Test 
	def void generarExpedienteAleatorio(){
		
		expediente.generarExpedienteAleatorio()
		
		assertEquals(expediente.villanos.size,6)
		
		//System.out.println(expediente)
	}

	@Test 
	def void crearVillano(){
		
		expediente.nuevoVillano("El Gato", Sexo.Masculino)
		
		assertFalse(expediente.villanos.isEmpty)
		assertEquals("El Gato", expediente.villanos.get(0).nombre)
		assertEquals(Sexo.Masculino, expediente.villanos.get(0).sexo)
	}
	
	@Test 
	def void eliminarVillano(){
		
		expediente.nuevoVillano("El Gato", Sexo.Masculino)
		assertFalse(expediente.villanos.isEmpty)
		
		expediente.eliminarVillano("El Gato")
		assertTrue(expediente.villanos.isEmpty)
	}

}