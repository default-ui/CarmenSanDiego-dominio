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
		var caracteristicasPais = #['C1','C2','C3']
		when(paisMock.caracteristicas).thenReturn(caracteristicasPais)		
		
		// preparo el mock del villano
		villanoMock = mock(Villano)
		var senasVillano = #['SP1', 'SP2', 'SP3']
		var hobbiesVillano = #['H1', 'H2', 'H3']
		when(villanoMock.senasParticulares).thenReturn(senasVillano)		
		when(villanoMock.hobbies).thenReturn(hobbiesVillano)
		
		randomMock = mock(Random)
		when(randomMock.nextInt(anyInt())).thenReturn(0)		
		
	}
	
	@Test def void pistasBanco(){
		
		banco = new Banco()
		
		assertEquals("Bank", banco.nombre)
		assertEquals("PistaBanco", banco.obtenerPistas)
		
		// preparo el mock de Random
		banco.randomGen = randomMock // hago que el banco use mi random mockeado
				
		assertEquals("C1 SP1", 
			banco.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextInt(anyInt())).thenReturn(2)
		
		assertEquals("C3 SP3", 
			banco.obtenerPista(paisMock, villanoMock)
		)		
		
	}
	
	@Test def void pistasBiblioteca(){
		
		biblioteca = new Biblioteca()
		
		assertEquals("Library", biblioteca.nombre)
		assertEquals("PistaBiblioteca", biblioteca.obtenerPistas)
		
		// preparo mock del random
		biblioteca.randomGen = randomMock
		when(randomMock.nextBoolean).thenReturn(false)
		
		assertEquals("C1 SP1", 
			biblioteca.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextBoolean).thenReturn(true)
		
		assertEquals("C1 SP1 H1", 
			biblioteca.obtenerPista(paisMock, villanoMock)
		)
		
	}
	
	@Test def void pistasClub(){
		
		club = new Club()
		
		assertEquals("Club", club.nombre)
		assertEquals("PistaClub", club.obtenerPistas)
		
		// preparo mock del random
		club.randomGen = randomMock
		when(randomMock.nextInt(10)).thenReturn(10) // cuando pido porcentaje da 10	
		
		assertEquals("SP1 SP1", 
			club.obtenerPista(paisMock, villanoMock)
		)
		
		// si cambio el valor de random cambian los resultados
		when(randomMock.nextInt(10)).thenReturn(0) // cuando pido porcentaje da 0 ahora	
		
		assertEquals("SP1 SP1 H1", 
			club.obtenerPista(paisMock, villanoMock)
		)
		
	}
	
	@Test def void pistasEmbajada(){
		
		embajada = new Embajada()
		
		assertEquals("Embasy", embajada.nombre)
		assertEquals("PistaEmbajada", embajada.obtenerPistas)
		
		// preparo mock de random
		embajada.randomGen = randomMock
		
		assertEquals("C1 C1", 
			embajada.obtenerPista(paisMock, villanoMock)
		)
		
	}
}