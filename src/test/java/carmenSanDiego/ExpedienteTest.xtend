package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before
import java.util.ArrayList

class ExpedienteTest {
	
	Expediente expediente
	
	@Before def void setUp(){
		expediente = new Expediente
	}
	
	@Test 
	def void crearExpedienteBase(){
		//var expediente = new Expediente
		expediente.generarExpedienteAleatorio()
		assertEquals(expediente.villanos.size,20)
		System.out.println(expediente.villanos.get(0).nombre)
		System.out.println("")
		System.out.println("Hobbies: ")
		for (i:0..<expediente.villanos.get(0).hobbies.size)
			System.out.println(expediente.villanos.get(0).hobbies.get(i))
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
		expediente.nuevoVillano("El Gadsto", Sexo.Masculino)
		//xpediente.eliminarVillano("El Gao")
		//assertEquals(expediente.villanos, new ArrayList<Villano>())
		assertTrue(expediente.villanos.isEmpty)
	}
}