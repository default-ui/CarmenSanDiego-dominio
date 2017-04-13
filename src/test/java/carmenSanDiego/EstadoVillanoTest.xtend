package carmenSanDiego

import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class EstadoVillanoTest {
	
	EstadoVillano estadoVillano
	Villano villanoElGato
	Villano villanoScar
	Banco banco
	
	@Before
	def void init(){
		estadoVillano = new EstadoVillano
		villanoElGato = new Villano("El gato", Sexo.Masculino)
		villanoScar = new Villano("Scar", Sexo.Masculino)
		banco = new Banco()
		}
		
	@Test def void responderVillanoEnElPaisPeroNoEnLugar(){
		
		assertEquals(
			"Peligro, el villano está en el país. Tené cuidado",
			estadoVillano.responder(new Pais("Argentina"), new Banco, villanoElGato, new OrdenDeArresto(villanoElGato))
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarConOrdenDeArrestoCorrecta(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"Ha detenido a Scar con exito!!!",
			estadoVillano.responder(new Pais("Argentina"), banco, villanoScar,new OrdenDeArresto(villanoScar))
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarSinOrdenDeArresto(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"El villano ha sido liberado por el juez por no tener orden de arresto",
			estadoVillano.responder(new Pais("Argentina"), banco, villanoScar, null)
		)
		
	}
	
	@Test def void responderVillanoEnElPaisYEnLugarConOrdenDeArrestoIncorrecta(){
		
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"El villano ha sido liberado por el juez por tener orden de arresto incorrecta",
			estadoVillano.responder(new Pais("Argentina"), banco, villanoScar, new OrdenDeArresto(villanoElGato))
		)
			
	}
	
}