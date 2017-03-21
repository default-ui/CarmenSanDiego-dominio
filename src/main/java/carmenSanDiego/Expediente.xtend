package carmenSanDiego

import java.util.Random
import java.io.BufferedReader
import java.io.FileReader
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.LinkedHashSet
import static utils.FileParser.*

class Expediente {

	@Accessors val villanos = <Villano>newArrayList()

	def void nuevoVillano(String nombre, Sexo sexo) {
		val villano = new Villano(nombre, sexo)
		this.villanos.add(villano)
	}

	def void eliminarVillano(Villano villano) {
		this.villanos.remove(villanos.indexOf(villano))
	}

	// TODO aca hay que permitir cambiar el Random	
	def Villano obtenerVillano() {
		return villanos.get(new Random().nextInt(villanos.size()))
	}

	def void generarExpedienteAleatorio() {
		val reader = new BufferedReader(new FileReader("src/main/resources/dataVillanos.csv"))
		val lines = new ArrayList()
		var line = null as String
		val senas = obtenerSenas()
		val hobbiesA = obtenerHobbies()
		while ((line = reader.readLine()) !== null) {
			lines.add(line);
		}
		for (i : 0 ..< lines.size) {
			val listaCar = lines.get(i).split("  ")
			var villano = new Villano(listaCar.get(0), Sexo.valueOf(listaCar.get(1)))
			val hobbs = new LinkedHashSet<String>()
			val sens = new LinkedHashSet<String>()
			for (h : 0 ..< 5) {
				val sena = senas.get(new Random().nextInt(senas.size()))
				val hobbie = hobbiesA.get(new Random().nextInt(hobbiesA.size()))
				sens.add(sena)
				hobbs.add(hobbie)
			}
			villano.senasParticulares = sens.toList
			villano.hobbies = hobbs.toList
			villanos.add(villano)
		}
	}

	def obtenerSenas() {
		getListFromFile("src/main/resources/dataSenas.csv")
	}

	def obtenerHobbies() {
		getListFromFile("src/main/resources/dataHobbies.csv")
	}

}
