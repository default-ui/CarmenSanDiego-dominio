package carmenSanDiego

import static org.junit.Assert.*
import org.junit.Test
import org.junit.Before

class PaisTest {

	Pais paisArgentina
	Pais paisBrazil
	Pais paisPeru
	Pais paisRusia

	Lugar lugarBiblioteca
	Lugar lugarBanco
	
	Villano villanoMoriarty

	@Before
	def void init() {

		paisArgentina = new Pais("Argentina")
		paisBrazil = new Pais("Brazil")
		paisPeru = new Pais("Peru")
		paisRusia = new Pais("Rusia")

		lugarBiblioteca = new Biblioteca()
		lugarBanco = new Banco()
		
		villanoMoriarty = new Villano("Moriarty", Sexo.Masculino)

	}

	@Test def creacionDePais() {
		
		assertEquals("Argentina", paisArgentina.nombre)
		assertEquals(0, paisArgentina.caracteristicas.size)
		assertEquals(0, paisArgentina.lugares.size)
		assertEquals(0, paisArgentina.conexiones.size)
		
	}

	@Test def agregarYModificarCaracteristica() {
		
		paisBrazil.agregarCaracteristica("c1")
		paisBrazil.editarCaracteristica("c1", "c2")
		
		assertEquals(1, paisBrazil.caracteristicas.size)
		assertEquals("c2", paisBrazil.caracteristicas.get(0))
		
	}

	@Test def agregarYModificarConexion() {
		
		paisArgentina.agregarConexion(paisBrazil)
		paisArgentina.editarConexion(paisBrazil, paisPeru)
		
		assertEquals(1, paisArgentina.conexiones.size)
		assertEquals("Peru", paisArgentina.conexiones.get(0).nombre)
		
	}

	@Test def agregarLugar() {

		paisArgentina.agregarLugar(lugarBiblioteca)
		paisArgentina.editarLugar(lugarBiblioteca, lugarBanco)
		
		assertEquals(1, paisArgentina.lugares.size)
		assertEquals("Bank", paisArgentina.lugares.get(0).nombre)

	}

	@Test def comprobarEstadoCuidador() {
		
		// TODO esto hay que pasarlo a mock
		paisArgentina.agregarLugar(lugarBanco)
		
		assertEquals(
			"No vimos a nadie con tales caracteristicas por esta zona, creo que te equivocaste.",
			paisArgentina.pedirPistaOcupante(lugarBanco, villanoMoriarty, paisBrazil, null)
		)

	}

	@Test def comprobarCambioAEstadoVillano() {
		
		paisArgentina.agregarLugar(lugarBanco)
		paisBrazil.setEstadoOcupante(new EstadoVillano())
		
		assertEquals(
			"Peligro, el villano está en el país. Tené cuidado",
			paisBrazil.pedirPistaOcupante(lugarBanco, villanoMoriarty, paisBrazil, null)
		)
		
	}

	@Test def obtienePistaDeBancoSiEstaEnEstadoInformante() {
		
		paisRusia.agregarLugar(lugarBanco)
		paisBrazil.agregarCaracteristica("Fue al pais mais grande do mundo!")
		villanoMoriarty.agregarSena("Este villano es el nemesis de Sherlock Holmes.")
		paisRusia.setEstadoOcupante(new EstadoInformante())
		
		assertEquals(
			"Fue al pais mais grande do mundo! Este villano es el nemesis de Sherlock Holmes.",
			paisRusia.pedirPistaOcupante(lugarBanco, villanoMoriarty, paisBrazil, null)
		)
	}
}
