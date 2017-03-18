package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

class Mapamundi {
	@Accessors val paises = <Pais>newArrayList()
	
	def nuevoPais(String nombre){
		val pais = new Pais(nombre) 
		this.paises.add(pais)
	}
	
	def eliminarPais(Pais pais){
		this.paises.remove(paises.indexOf(pais))
	}
	
	def editarPais(Pais pais){
		this.eliminarPais(pais)
		this.nuevoPais(pais.nombre)
	}
	
	def Pais obtenerPaisDelRobo() {
		return paises.get(new Random().nextInt(paises.size()))
	}
}
