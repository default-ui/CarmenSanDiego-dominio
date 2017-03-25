package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.Scanner
import java.io.File
import java.util.ArrayList
import java.io.BufferedReader
import java.io.FileReader
import java.util.LinkedHashSet
import java.util.List

class Mapamundi {

	@Accessors var List<Pais> paises = <Pais>newArrayList()

	def nuevoPais(String nombre) {
		val pais = new Pais(nombre)
		this.paises.add(pais)
	}

	def eliminarPais(String nombre) {
		this.paises = paises.filter([p | p.nombre != nombre]).toList
	}

	def editarPais(String nombre) {
		this.eliminarPais(nombre)
		this.nuevoPais(nombre)
	}

	// TODO revisar, con esta implementacion el pais del robo cambia cada vez que se lo pide	
	def Pais obtenerPaisDelRobo() {
		return paises.get(new Random().nextInt(paises.size()))
	}

	// TODO revisar, descomponer, simplificar, comentar. algo. jaja.
	def generarMapamundiAleatorio() {

		val content = new Scanner(new File("src/main/resources/datapaises.txt"))
		while (content.hasNext()) {
			nuevoPais(content.next())
		}
		val reader = new BufferedReader(new FileReader("src/main/resources/datacaracteristicas.csv"))
		val lines = new ArrayList()
		var line = null as String
		while ((line = reader.readLine()) !== null) {
			lines.add(line);
		}
		for (i : 0 ..< lines.size) {
			val listaCar = lines.get(i).split("  ")
			paises.get(i).caracteristicas = listaCar.toList
			val nueva = new LinkedHashSet<Pais>()
			for (c : 0 ..< 3) {
				val paisConect = paises.get(new Random().nextInt(paises.size()))
				nueva.add(paisConect)
				if (!paisConect.conexiones.contains(paises.get(i))){ 
					paisConect.conexiones.add(paises.get(i))
					}
			}
			nueva.remove(paises.get(i))
			paises.get(i).conexiones = nueva.toList
		}
	}
}
