package carmenSanDiego

import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class VillanoTest {

	Sexo sexoFemenino
	Sexo sexoMasculino
	Villano carmen

	@Before
	def void init() {

		sexoFemenino = Sexo.Femenino
		sexoMasculino = Sexo.Masculino

		carmen = new Villano('Carmen Sandiego', sexoFemenino)
	}

	@Test
	def void testGetters() {

		assertEquals('Carmen Sandiego', carmen.getNombre)
		assertEquals(Sexo.Femenino, carmen.getSexo)

	}

	@Test
	def void testSenasParticulares() {

		assertEquals(0, carmen.senasParticulares.size)

		// agrego una seña particular
		carmen.agregarSena("Malota")

		assertEquals(1, carmen.senasParticulares.size)
		assertTrue(carmen.senasParticulares.contains("Malota"))

		// modifico la seña
		carmen.editarSena("Malota", "Malísima")

		assertEquals(1, carmen.senasParticulares.size)
		assertTrue(carmen.senasParticulares.contains("Malísima"))
		assertFalse(carmen.senasParticulares.contains("Malota"))

		// elimino la seña
		carmen.eliminarSena("Malísima")

		assertEquals(0, carmen.senasParticulares.size)

	}

	@Test
	def void testHobbies() {

		assertEquals(0, carmen.hobbies.size)

		// agrego un hobbie
		// TRIVIA: en inglés americano es Hobby
		carmen.agregarHobbie("Malotear")

		assertEquals(1, carmen.hobbies.size)
		assertTrue(carmen.hobbies.contains("Malotear"))

		// modifico un hobbie
		carmen.editarHobbie("Malotear", "Hacer Maldades")

		assertEquals(1, carmen.hobbies.size)
		assertTrue(carmen.hobbies.contains("Hacer Maldades"))
		assertFalse(carmen.hobbies.contains("Malotear"))

		// elimino un hobbie
		carmen.eliminarHobbie("Hacer Maldades")

		assertEquals(0, carmen.hobbies.size)

	}

}
