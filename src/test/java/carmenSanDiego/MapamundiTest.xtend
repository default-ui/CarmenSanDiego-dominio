package carmenSanDiego

import org.junit.Test
import static org.junit.Assert.*
import java.io.FileReader
import static extension com.google.common.io.CharStreams.*

class MapamundiTest {
	
	@Test def crearPaisesNuevos(){
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		assertEquals(mapa.paises.size, 3)
	}
	
	@Test def eliminarPaises(){
		val mapa = new Mapamundi
		mapa.nuevoPais("Espanha")
		mapa.nuevoPais("Grecia")
		mapa.nuevoPais("Irak")
		mapa.eliminarPais(mapa.paises.get(1))
		assertEquals(mapa.paises.size, 2)
		
	}
	
	@Test def imprimirPaises(){
		val mapa = new Mapamundi
		mapa.generarMapamundiAleatorio()
		assertEquals(mapa.paises.size,20)
		System.out.println("Pais: "+mapa.paises.get(13).nombre)
		System.out.println(" ")
		System.out.println("Conexiones: ")
		for (i:0..<mapa.paises.get(13).conexiones.size){
			System.out.println(mapa.paises.get(13).conexiones.get(i).nombre)
		}
		System.out.println(" ")
		System.out.println("Caracteristicas: ")
		for (i:0..<mapa.paises.get(13).caracteristicas.size){
			System.out.println(mapa.paises.get(13).caracteristicas.get(i))
		}
	}
		
}