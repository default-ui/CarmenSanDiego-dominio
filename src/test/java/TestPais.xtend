package carmenSanDiego

import org.junit.Test
import static org.junit.Assert.*

class TestPais {
	
	@Test def creacionDePais(){
		val miPais = new Pais("Argentina")
		assertEquals(miPais.nombre,"Argentina")
		assertEquals(miPais.caracteristicas.size,0)
		assertEquals(miPais.lugares.size,0)
		assertEquals(miPais.conexiones.size,0)
	}
	
	@Test def agregarYModificarCaracteristica(){
		val miPais = new Pais("Brazil")
		miPais.agregarCaracteristica("c1")
		miPais.editarCaracteristica("c1","c2")
		assertEquals(miPais.caracteristicas.size,1)
		assertEquals(miPais.caracteristicas.get(0), "c2")
	}
	
	@Test def agregarYModificarConexion(){
		val miPais = new Pais("Brazil")
		val miPais2 = new Pais("Argentina")
		miPais.agregarConexion(miPais2)
		miPais.editarConexion(miPais2,miPais)
		assertEquals(miPais.conexiones.size,1)
		assertEquals(miPais.conexiones.get(0).nombre, "Brazil")
	}
	
	@Test def agregarLugar(){
		val miPais = new Pais("Peru")
		val miLugar = new Biblioteca()
		val miLugar2 = new Banco()
		miPais.agregarLugar(miLugar)
		miPais.editarLugar(miLugar,miLugar2)
		assertEquals(miPais.lugares.size,1)
		assertEquals(miPais.lugares.get(0).nombre, "Bank")
	}
}