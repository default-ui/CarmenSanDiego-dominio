package carmenSanDiego

import org.junit.Test
import static org.junit.Assert.*

class EstadoCuidadorTest {
	
	@Test def void responderTest(){
		var estadoCuidador = new EstadoCuidador
		assertEquals(estadoCuidador.responder(new Pais("Argentina"), new Banco, new Villano("El gato", Sexo.Masculino), null), 
			"No vimos a nadie con tales caracteristicas por esta zona, creo que te equivocaste."
		)
		
		
	}
}