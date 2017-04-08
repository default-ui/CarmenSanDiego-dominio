package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*

class EstadoVillanoTest {
	
	@Test def void responderVillanoEnElPaisPeroNoEnLugar(){
		var estadoVillano = new EstadoVillano
		
		assertEquals(estadoVillano.responder(new Pais("Argentina"), new Banco, new Villano("El gato", Sexo.Masculino), new Villano ("Moriarty", Sexo.Masculino)),  
					 "Peligro, el villano está en el país. Tené cuidado")
		
	}
	
		@Test def void responderVillanoEnElPaisYEnLugar(){
		var estadoVillano = new EstadoVillano
		var banco = new Banco
		banco.seEncuentraVillano =  true
		
		assertEquals(estadoVillano.responder(new Pais("Argentina"), banco, new Villano("Moriarty", Sexo.Masculino), new Villano ("Moriarty", Sexo.Masculino)),  
					 "ALTO!!! Detengase: Moriarty")
		
	}
	
}