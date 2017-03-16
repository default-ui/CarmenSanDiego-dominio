import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class VillanoTest {
	
	Sexo sexoFemenino
	Sexo sexoMasculino
	Villano carmen
	
	@Before
	def void init() {
		
		sexoFemenino = Sexo.Femenino
		sexoMasculino = Sexo.Masculino
		
		carmen = new Villano('Carmen Sandiego', sexoFemenino)
	}
	
	@Test
	def void test_getters() {
		
		assertEquals('Carmen Sandiego', carmen.getNombre)
		assertEquals('Femenino', carmen.getSexo)
		
	}
	
}