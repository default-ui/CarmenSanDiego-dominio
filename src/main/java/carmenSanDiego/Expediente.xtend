package carmenSanDiego

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

	def void eliminarVillano(String villanoNombre) {
		this.villanos = villanos.filter([v | v.nombre != villanoNombre]).toList
		
	}

	// TODO aca hay que permitir cambiar el Random	
	def Villano obtenerVillano() {
		return villanos.get(new Random().nextInt(villanos.size()))
	}

	/**
	 * Genera un listado de villanos con caracteristicas aleatorias
	 */
	def void generarExpedienteAleatorio() {
		
		val listaVillanos = obtenerVillanos()
		val listaSenas = obtenerSenas()
		val listaHobbies = obtenerHobbies()
		
		for (i : 0 ..< listaVillanos.size) {

			// creo el nuevo villano usando datos de la lista de villanos			
			val datosNuevoVillano = listaVillanos.get(i).split("  ")
			var villano = new Villano(datosNuevoVillano.get(0), Sexo.valueOf(datosNuevoVillano.get(1)))
			
			// consigo 5 caracteristicas random de cada tipo para el villano nuevo
			// TODO aca tambien se puede usar el random			
			for (j : 0 ..< 5) {
				val sena = listaSenas.get(new Random().nextInt(listaSenas.size()))
				val hobbie = listaHobbies.get(new Random().nextInt(listaHobbies.size()))
				villano.agregarSena(sena)
				villano.agregarHobbie(hobbie)
			}
			
			villanos.add(villano)
		}
	}

	def private obtenerSenas() {
		getListFromFile("src/main/resources/dataSenas.csv")
	}

	def private obtenerHobbies() {
		getListFromFile("src/main/resources/dataHobbies.csv")
	}
	
	def private obtenerVillanos() {
		getListFromFile("src/main/resources/dataVillanos.csv")
	}

}
