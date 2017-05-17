package carmenSanDiego

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class EstadoVillanoTest {
	
	EstadoVillano estadoVillano
	
	Villano villanoElGato
	Villano villanoScar
	OrdenDeArresto ordenElGato
	OrdenDeArresto ordenScar
	
	Pais argentina
	Banco banco
		
	@Before
	def void init(){
		
		estadoVillano = new EstadoVillano
		
		villanoElGato = new Villano(1, "El gato", Sexo.Masculino)
		villanoScar = new Villano(1, "Scar", Sexo.Masculino)
		ordenElGato = new OrdenDeArresto( villanoElGato )
		ordenScar = new OrdenDeArresto( villanoScar )
		
		argentina = new Pais("Argentina")
		banco = new Banco()
		
	}
		
	@Test def void responderVillanoEnElPaisPeroNoEnLugar(){
		
		assertEquals(
			"Peligro, el villano está en el país. Tené cuidado",
			estadoVillano.responder(argentina, banco, villanoElGato, ordenElGato)
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarConOrdenDeArrestoCorrecta(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"Ha detenido a Scar con exito!!!",
			estadoVillano.responder(argentina, banco, villanoScar, ordenScar)
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarSinOrdenDeArresto(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"El villano ha sido liberado por el juez por no tener orden de arresto",
			estadoVillano.responder(argentina, banco, villanoScar, null)
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarConOrdenDeArrestoIncorrecta(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"El villano ha sido liberado por el juez por tener orden de arresto incorrecta",
			estadoVillano.responder(argentina, banco, villanoScar, ordenElGato)
		)
			
	}
	
}