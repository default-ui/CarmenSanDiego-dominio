package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList

class CasoTest {
	
	@Test def void reporteTest(){
		
		val villano = new Villano(1, "El gato", Sexo.Masculino)
		val objeto = 'zircon'
		val ruta = new ArrayList<Pais>
		val pais = new Pais("Springfield") 
		
		var caso = new Caso(villano, objeto, ruta, pais)
		
		assertEquals("¡¡¡Ha desaparecido zircon!!!", caso.reporte.get(0))
		assertEquals("Se encontraba en exposición en el Museo Nacional de Springfield.", caso.reporte.get(1))
		assertEquals("El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna.", caso.reporte.get(2))
		assertEquals("Su misión como detective es descifrar el responsable de tal crimen y apresarlo.", caso.reporte.get(3))
	
	}
}