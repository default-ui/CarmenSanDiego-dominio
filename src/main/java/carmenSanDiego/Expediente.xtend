package carmenSanDiego

import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

import static utils.FileParser.*

class Expediente {

	@Accessors var List<Villano> villanos = <Villano>newArrayList()
	@Accessors Random randomGen = new Random()

	def void nuevoVillano(String nombre, Sexo sexo) {
		val villano = new Villano(nombre, sexo)
		this.villanos.add(villano)
	}

	def void eliminarVillano(String villanoNombre) {
		this.villanos = villanos.filter([v | v.nombre != villanoNombre]).toList
	}
	
	/**
	 * Obtiene un villano aleatorio del expediente
	 */
	def Villano obtenerVillano() {
		villanos.get(randomGen.nextInt(villanos.size()))
	}

	/**
	 * Genera un listado de villanos con caracteristicas aleatorias
	 */
	def void generarExpedienteAleatorio() {
		
		val listaVillanos = obtenerVillanos()
		val listaHobbies = obtenerHobbies()
		
		for (i : 0 ..< listaVillanos.size) {

			// creo el nuevo villano usando datos de la lista de villanos			
			val List<String> datosNuevoVillano = listaVillanos.get(i).split("  ")
			var villano = new Villano(datosNuevoVillano.get(0), Sexo.valueOf(datosNuevoVillano.get(1)))
			// agrego senas particulares segun orden de archivos csv
			for(var k = 2; datosNuevoVillano.size > k; k++){
				villano.agregarSena(datosNuevoVillano.get(k))}
			// consigo 5 caracteristicas random de cada tipo para el villano nuevo	
			//TODO refactorizar todo esto	
			for (j : 0 ..< 5) {
				val hobbie = listaHobbies.get(randomGen.nextInt(listaHobbies.size()))
				villano.agregarHobbie(hobbie)
			}
			
			villanos.add(villano)
		}
	}

	def private obtenerHobbies() {
		getListFromFile("/dataHobbies.csv")
	}
	
	def private obtenerVillanos() {
		getListFromFile("/dataVillanos.csv")
	}

	override toString() {
		
		var sb = new StringBuilder();
		
		sb.append("-- Expediente --").append(System.getProperty("line.separator"));
		
		sb.append("- Villanos de Expediente:").append(System.getProperty("line.separator"));
		for (v : villanos) {
			sb.append(v).append(System.getProperty("line.separator"));
		}
		
		sb.append("-- Fin Expediente --").append(System.getProperty("line.separator"));
		
		sb.toString
				
	}
	
}
