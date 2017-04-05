package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.Scanner
import java.io.File
import java.util.ArrayList
import java.io.BufferedReader
import java.io.FileReader
import java.util.LinkedHashSet

class Mapamundi {

	@Accessors val paises = <Pais>newArrayList()
	private var Pais paisDelRobo

	def nuevoPais(String nombre) {
		val pais = new Pais(nombre)
		this.paises.add(pais)
	}

	def eliminarPais(Pais pais) {
		this.paises.remove(paises.indexOf(pais))
	}

	def editarPais(Pais pais) {
		this.eliminarPais(pais)
		this.nuevoPais(pais.nombre)
	}

	def Pais obtenerPaisDelRobo() {
        if (paisDelRobo == null) paisDelRobo = randomPais()
        return paisDelRobo
	}

    def private Pais randomPais(){
        paises.get(new Random().nextInt(paises.size()))
    }

	def generarMapamundiAleatorio() {
        generarPaises()
        generarCaracteristicasYConexiones()
	}


    // Private

    def private generarCaracteristicasYConexiones() {
        val reader = new BufferedReader(new FileReader("src/main/resources/datacaracteristicas.csv"))
        val lineasDeCaracteristicas = new ArrayList()
        var String line
        while ((line = reader.readLine()) !== null) {
            lineasDeCaracteristicas.add(line);
        }
        for (numeroDeLinea : 0 ..< lineasDeCaracteristicas.size) {
            generarCaracteristicas(lineasDeCaracteristicas, numeroDeLinea)
            generarConexiones(numeroDeLinea)
        }
    }


    def private generarPaises() {
        val nombresDePaises = new Scanner(new File("src/main/resources/datapaises.txt"))
        while (nombresDePaises.hasNext()) {
            nuevoPais(nombresDePaises.next())
        }
    }

    def private generarConexiones(Integer numeroDeLinea) {
        val nueva = new LinkedHashSet<Pais>()
        for (c : 0 ..< 3) {
            val paisConect = paises.get(new Random().nextInt(paises.size()))
            nueva.add(paisConect)
            if (!paisConect.conexiones.contains(paises.get(numeroDeLinea))){
                paisConect.conexiones.add(paises.get(numeroDeLinea))
            }
        }
        nueva.remove(paises.get(numeroDeLinea))
        paises.get(numeroDeLinea).conexiones = nueva.toList
    }

    def private generarCaracteristicas(ArrayList<String> lineasDeCaracteristicas ,Integer numeroDeLinea) {
        val listaCar = lineasDeCaracteristicas.get(numeroDeLinea).split("  ")
        paises.get(numeroDeLinea).caracteristicas = listaCar.toList
    }
}
