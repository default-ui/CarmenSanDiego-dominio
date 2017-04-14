package carmenSanDiego

import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import static org.mockito.Mockito.*
import java.util.Random

class LugaresTest {
	
	var Banco banco
	var Biblioteca biblioteca
	var Club club
	var Embajada embajada
	
	var Pais paisMock
	var Villano villanoMock
	var Random randomMock
	
	@Before def void setup() {

		// preparo el mock del pais
		paisMock = mock(Pais)
		var caracteristicasPais = #['Llevaba un koala de peluche','Estaba practicando ingles','Llevaba consigo una tabla de surf']
		when(paisMock.caracteristicas).thenReturn(caracteristicasPais)		
		
		// preparo el mock del villano
		villanoMock = mock(Villano)
		var senasVillano = #['De pelo negro', 'De gran estatura', 'De pies grandes']
		var hobbiesVillano = #['Robar', 'Malotear', 'Ajedrez']
		when(villanoMock.senasParticulares).thenReturn(senasVillano)		
		when(villanoMock.hobbies).thenReturn(hobbiesVillano)
		
		randomMock = mock(Random)
		when(randomMock.nextInt(anyInt())).thenReturn(0)		
		
	}
	
	@Test def void pistasBanco(){
		
		banco = new Banco()
		
		assertEquals("Banco", banco.nombre)
		
		// preparo el mock de Random
		banco.randomGen = randomMock // hago que el banco use mi random mockeado
				
		assertEquals("Llevaba un koala de peluche. Es de pelo negro. ", 
			banco.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextInt(anyInt())).thenReturn(2)
		
		assertEquals("Llevaba consigo una tabla de surf. Es de pies grandes. ", 
			banco.obtenerPista(paisMock, villanoMock)
		)		
		
	}
	
	@Test def void pistasBiblioteca(){
		
		biblioteca = new Biblioteca()
		
		assertEquals("Biblioteca", biblioteca.nombre)
		
		// preparo mock del random
		biblioteca.randomGen = randomMock
		when(randomMock.nextBoolean).thenReturn(false)
		
		assertEquals("Llevaba un koala de peluche. Es de pelo negro. ", 
			biblioteca.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextBoolean).thenReturn(true)
		
		assertEquals("Llevaba un koala de peluche. Es de pelo negro. Se rumorea que disfruta de robar. ", 
			biblioteca.obtenerPista(paisMock, villanoMock)
		)
		
	}
	
	@Test def void pistasClub(){
		
		club = new Club()
		
		assertEquals("Club", club.nombre)
		
		// preparo mock del random
		club.randomGen = randomMock
		when(randomMock.nextInt(10)).thenReturn(10) // cuando pido porcentaje da 10	
		
		assertEquals("Es de pelo negro. Es de pelo negro. ", 
			club.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextInt(10)).thenReturn(0) // cuando pido porcentaje da 0 ahora	
		
		assertEquals("Es de pelo negro. Es de pelo negro. Se rumorea que disfruta de robar. ", 
			club.obtenerPista(paisMock, villanoMock)
		)
		
	}
	
	@Test def void pistasEmbajada(){
		
		embajada = new Embajada()
		
		assertEquals("Embajada", embajada.nombre)
		
		// preparo mock de random
		embajada.randomGen = randomMock
		
		assertEquals("Llevaba un koala de peluche. Llevaba un koala de peluche. ", 
			embajada.obtenerPista(paisMock, villanoMock)
		)
		
	}
}