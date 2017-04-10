package carmenSanDiego

import org.junit.Test

import static org.junit.Assert.*
import net.sf.oval.constraint.AssertConstraintSet.List

class MapamundiTest {

	@Test def crearPaisesNuevos() {
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		assertEquals(mapa.paises.size, 3)
	}

	@Test def eliminarPaises() {
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		mapa.eliminarPais("Grecia")
		assertEquals(mapa.paises.size, 2)

	}
	
	@Test def imprimirPaises() {
		
		val mapa = new Mapamundi
		mapa.generarMapamundiAleatorio()
		
		assertEquals(20, mapa.paises.size)
		
		for(p:0..<20){
			System.out.println("Pais: " + mapa.paises.get(p).nombre)
			System.out.println(" ")
			for (i : 0 ..< mapa.paises.get(p).lugares.size) {
				System.out.println(mapa.paises.get(p).lugares.get(i).nombre)
			}
			System.out.println(" ")
			System.out.println("Conexiones: ")
			for (i : 0 ..< mapa.paises.get(p).conexiones.size) {
				System.out.println(mapa.paises.get(p).conexiones.get(i).nombre)
			}
			System.out.println(" ")
			System.out.println("Caracteristicas: ")
			for (i : 0 ..< mapa.paises.get(p).caracteristicas.size) {
				System.out.println(mapa.paises.get(p).caracteristicas.get(i))
			}
			System.out.println("")
			System.out.println("=============================")
			System.out.println("")
		}
	}
	
	
}
