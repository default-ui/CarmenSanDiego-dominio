package carmenSanDiego
import org.junit.Test
import static org.junit.Assert.*
import org.junit.Before

class ExpedienteTest {
	
	@Test 
	def void crearExpedienteBase(){
		val expediente = new Expediente
		expediente.generarExpedienteAleatorio()
		assertEquals(expediente.villanos.size,20)
		System.out.println(expediente.villanos.get(0).nombre)
		System.out.println("")
		System.out.println("Hobbies: ")
		for (i:0..<expediente.villanos.get(0).hobbies.size)
			System.out.println(expediente.villanos.get(0).hobbies.get(i))
	}

}