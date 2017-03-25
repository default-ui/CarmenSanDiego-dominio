package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*

class EstadoVillanoTest {
	
	@Test def void responderVillanoEnElPais(){
		var estadoVillano = new EstadoVillano
		
		assertEquals(estadoVillano.responder(new Pais("Argentina"), new Banco, new Villano("EL gato", Sexo.Masculino)), 
					 "Peligro, el villano está en el país. Tené cuidado")
		
	}
	
}