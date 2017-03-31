package carmenSanDiego

import java.util.LinkedHashSet
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

import static utils.FileParser.*

class Expediente {

	@Accessors var List<Villano >villanos = <Villano>newArrayList()

	def void nuevoVillano(String nombre, Sexo sexo) {
		val villano = new Villano(nombre, sexo)
		this.villanos.add(villano)
	}

	def void eliminarVillano(String villano) {
		this.villanos = villanos.filter([v | v.nombre != villano]).toList
		
	}

	// TODO aca hay que permitir cambiar el Random	
	def Villano obtenerVillano() {
		return villanos.get(new Random().nextInt(villanos.size()))
	}

	def void generarExpedienteAleatorio() {
		
		val lines = obtenerVillanos()
		val senas = obtenerSenas()
		val hobbiesA = obtenerHobbies()
		
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
	
	def obtenerVillanos() {
		getListFromFile("src/main/resources/dataVillanos.csv")
	}

}
