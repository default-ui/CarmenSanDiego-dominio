package carmenSanDiego

import org.junit.Test
import static org.junit.Assert.*

class MapamundiTest {
	
	@Test def crearPaisesNuevos(){
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		assertEquals(mapa.paises.size, 3)
	}
	
	@Test def eliminarPaises(){
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		mapa.eliminarPais(mapa.paises.get(1))
		assertEquals(mapa.paises.size, 2)
		
	}
}