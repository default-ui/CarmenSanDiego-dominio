package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList

class CasoTest {
	
	@Test def void reporteTest(){
		var caso = new Caso(new Villano("El gato", Sexo.Masculino), "zircon", 
							new ArrayList<Pais>, new Pais("Springfield"))
		assertEquals(caso.reporte, 
			"Ha desaparecido zircon!!!. Se encontraba en exposición en el Museo Nacional de Springfield. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective es descifrar el responsable de tal crímen y apresarlo."
		)
		
	}
}