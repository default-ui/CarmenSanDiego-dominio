
package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.ArrayList

class Pais {
	@Accessors String nombre
	@Accessors val caracteristicas = <String>newArrayList()
	@Accessors val conexiones = <Pais>newArrayList()
	@Accessors val lugares = <Lugar>newArrayList()
	@Accessors var EstadoOcupante estadoOcupante
	
	
	
	new(String nombre){
		this.nombre = nombre
		this.estadoOcupante = new EstadoCuidador()
	}
	
	def void agregarCaracteristica(String caracteristica){
		this.caracteristicas.add(caracteristica)
	}
	
	def void eliminarCaracteristica (String caracteristica){
		this.caracteristicas.remove(caracteristicas.indexOf(caracteristica))
	}
	
	def void editarCaracteristica (String antigua, String nueva){
		this.eliminarCaracteristica(antigua)
		this.agregarCaracteristica(nueva)
	}
	
	def void agregarConexion (Pais pais){
		this.conexiones.add(pais)
	}
	
	def void eliminarConexion (Pais conexion){
		this.conexiones.remove(conexiones.indexOf(conexion))
	}
	
	def void editarConexion (Pais antiguo, Pais nuevo){
		this.eliminarConexion(antiguo)
		this.agregarConexion(nuevo)
	}
	
	def void agregarLugar (Lugar lugar){
		this.lugares.add(lugar)
	}
	
	def void eliminarLugar (Lugar lugar){
		this.lugares.remove(lugares.indexOf(lugar))
	}
	
	def void editarLugar (Lugar antiguo, Lugar nuevo){
		this.eliminarLugar(antiguo)
		this.agregarLugar(nuevo)
	}
	
	def obtenerPista(Lugar lugar) {
		this.lugares.get(lugares.indexOf(lugar)).obtenerPistas()
	}
	
	def String obtenerPistas(Lugar lugar){
		this.estadoOcupante.responder(this, lugar)
	}
	
	def void setEstado(EstadoOcupante estado){
		this.estadoOcupante = estado
	}
	
	def Pais obtenerConexionSinRepetidos(ArrayList<Pais> paises) {
		val conexionesSinRepetidos = <Pais>newArrayList()
		for (Pais p:conexiones)
			if (!paises.contains(p)) conexionesSinRepetidos.add(p)
		return conexionesSinRepetidos.get(new Random().nextInt(conexionesSinRepetidos.size()))
	}
	
}