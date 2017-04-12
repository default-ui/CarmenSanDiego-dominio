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
		assertFalse(expediente.villanos.isEmpty)
		expediente.eliminarVillano("El Gato")
		assertTrue(expediente.villanos.isEmpty)
	}

	@Test
	def void crearExpedienteAleatorio(){
		expediente.generarExpedienteAleatorio
		assertEquals(expediente.villanos.size, 6)
		assertEquals(expediente.villanos.get(0).nombre, "James Moriarty")
		assertEquals(expediente.villanos.get(0).sexo, Sexo.Masculino)
		assertEquals(expediente.villanos.get(0).senasParticulares.get(0), "Nemesis de Sherlock Holmes")
		assertEquals(expediente.villanos.get(0).senasParticulares.get(1), "De pelo negro")
		assertEquals(expediente.villanos.get(0).senasParticulares.get(2), "Su ringtone es Stayin' alive")
		assertEquals(expediente.villanos.get(0).senasParticulares.get(3), "Irlandes")
	}
}