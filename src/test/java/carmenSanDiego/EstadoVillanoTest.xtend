package carmenSanDiego

import org.junit.Test
import org.junit.Ignore
import static org.junit.Assert.*

class EstadoVillanoTest {
	
	@Test def void responderVillanoEnElPaisPeroNoEnLugar(){
		var estadoVillano = new EstadoVillano
		
		assertEquals(estadoVillano.responder(new Pais("Argentina"), new Banco, new Villano("El gato", Sexo.Masculino), new Villano ("Moriarty", Sexo.Masculino)),  
					 "Peligro, el villano está en el país. Tené cuidado")
		
	}
	
		// TODO: esto está faileando, devuelve null
		@Test def void responderVillanoEnElPaisYEnLugar(){
		var estadoVillano = new EstadoVillano
		var banco = new Banco
		banco.seEncuentraVillano =  true
		
		assertEquals(
			"ALTO!!! Detengase: Moriarty",
			estadoVillano.responder(new Pais("Argentina"), banco, new Villano("Moriarty", Sexo.Masculino), new Villano ("Moriarty", Sexo.Masculino))
		);
		
	}
	
}