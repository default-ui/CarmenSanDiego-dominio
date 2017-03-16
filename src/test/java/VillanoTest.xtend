import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class VillanoTest {
	
	Villano unVillano
	
	@Before
	def void init() {
		unVillano = new Villano('Carmen SanDiego')
	}
	
	@Test
	def void test_getters() {
		
		assertEquals('Carmen SanDiego', unVillano.getNombre)
		
	}
	
}