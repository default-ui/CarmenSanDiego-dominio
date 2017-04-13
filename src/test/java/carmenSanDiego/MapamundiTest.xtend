package carmenSanDiego

import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*
import static org.junit.Assert.*
import java.util.Random

class MapamundiTest {
	
	var Mapamundi mapa
	
	@Before def void init() {
		
		mapa = new Mapamundi
		
	}

	@Test def crearPaisesNuevos() {

		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")

		assertEquals(3, mapa.paises.size)

	}

	@Test def eliminarPais() {
		
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		
		mapa.eliminarPais("Grecia")

		assertEquals(2, mapa.paises.size)

	}
	
	@Test def editarPais() {
		
		mapa.nuevoPais("España")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		
		mapa.editarPais("Grecia","Francia")

		assertEquals(3, mapa.paises.size)
		
		assertTrue( mapa.paises.stream()
			.filter(p | p.nombre == "Francia")
			.findFirst.isPresent
		)
		
		assertFalse( mapa.paises.stream()
			.filter(p | p.nombre == "Grecia")
			.findFirst.isPresent
		)

	}
	
	@Test def obtenerPaisDelRobo() {
		
		mapa.nuevoPais("España")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		
		var randomMock = mock(Random)
		when(randomMock.nextInt(anyInt())).thenReturn(1)		
		mapa.randomGen = randomMock
		
		// obtengo el pais del robo de forma aleatoria
		var paisDelRobo = mapa.obtenerPaisDelRobo
		
		assertEquals("Grecia", paisDelRobo.nombre)
		
		// si cambio el random, el pais no cambia
		when(randomMock.nextInt(anyInt())).thenReturn(0)		
		paisDelRobo = mapa.obtenerPaisDelRobo
		
		assertEquals("Grecia", paisDelRobo.nombre)
		
	}
		
	@Test def imprimirPaises() {
		
		mapa.generarMapamundiAleatorio()
		
		assertEquals(20, mapa.paises.size)
		
		for(p:0..<20){
			System.out.println("Pais: " + mapa.paises.get(p).nombre)
			System.out.println(" ")
			for (i : 0 ..< mapa.paises.get(p).lugares.size) {
				System.out.println(mapa.paises.get(p).lugares.get(i).nombre)
			}
			System.out.println(" ")
			System.out.println("Conexiones: ")
			for (i : 0 ..< mapa.paises.get(p).conexiones.size) {
				System.out.println(mapa.paises.get(p).conexiones.get(i).nombre)
			}
			System.out.println(" ")
			System.out.println("Caracteristicas: ")
			for (i : 0 ..< mapa.paises.get(p).caracteristicas.size) {
				System.out.println(mapa.paises.get(p).caracteristicas.get(i))
			}
			System.out.println("")
			System.out.println("=============================")
			System.out.println("")
		}
	}
	
	
}
