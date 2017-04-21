package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable

@Observable class Pais {

	@Accessors String nombre
	@Accessors List<String> caracteristicas = <String>newArrayList()
	@Accessors List<Pais> conexiones = <Pais>newArrayList()
	@Accessors List<Lugar> lugares = <Lugar>newArrayList()
	@Accessors EstadoOcupante estadoOcupante
	@Accessors Random randomGen = new Random()

	new(String nombre) {
		this.nombre = nombre
		this.estadoOcupante = new EstadoCuidador()
	}

	def void agregarCaracteristica(String caracteristica) {
		this.caracteristicas.add(caracteristica)
	}

	def void eliminarCaracteristica(String caracteristica) {
		this.caracteristicas.remove(caracteristicas.indexOf(caracteristica))
	}

	def void editarCaracteristica(String antigua, String nueva) {
		this.eliminarCaracteristica(antigua)
		this.agregarCaracteristica(nueva)
	}

	def void agregarConexion(Pais pais) {
		this.conexiones.add(pais)
		pais.conexiones.add(this)
	}

	def void eliminarConexion(Pais conexion) {
		this.conexiones.remove(conexiones.indexOf(conexion))
	}

	def void editarConexion(Pais antiguo, Pais nuevo) {
		this.eliminarConexion(antiguo)
		this.agregarConexion(nuevo)
	}

	def void agregarLugar(Lugar lugar) {
		this.lugares.add(lugar)
	}

	def void eliminarLugar(Lugar lugar) {
		this.lugares.remove(lugares.indexOf(lugar))
	}

	def void editarLugar(Lugar antiguo, Lugar nuevo) {
		this.eliminarLugar(antiguo)
		this.agregarLugar(nuevo)
	}

	def pedirPistaOcupante(Lugar lugar, Villano villano, Pais destino, OrdenDeArresto ordenDeArresto) {
		this.estadoOcupante.responder(destino, lugar, villano, ordenDeArresto)
	}

	/**
	 * Metodo auxiliar utilizado a la hora de crear el plan de escape. Evita que haya 
	 * dos paises iguales consecutivos en el plan.
	 */
	def Pais obtenerConexionSinRepetidos(ArrayList<Pais> paises) {
		
		val conexionesSinRepetidos = <Pais>newArrayList()
		
		for (Pais paisCandidato : conexiones) {
			// si el villano aun no paso antes por ese pais se agrega a la lista de candidatos, caso contrario se descarta.
			if(!paises.contains(paisCandidato)) conexionesSinRepetidos.add(paisCandidato)
		}
			
		// si el villano ya paso por todas las conexiones entonces no hay candidatos. Se agrega por defecto la primera.	
		if(conexionesSinRepetidos.isEmpty) conexionesSinRepetidos.add(conexiones.get(0))
		
		// selecciono un pais random de la lista resultante
		conexionesSinRepetidos.get(randomGen.nextInt(conexionesSinRepetidos.size))
	}
	
	/**
	 * Imprimo de una manera mas linda los datos del pais
	 */
	override toString() {
		
		var sb = new StringBuilder();
		
		sb.append(nombre).append(System.getProperty("line.separator"));
		sb.append(estadoOcupante).append(System.getProperty("line.separator"));
		
		sb.append("- Caracteristicas:").append(System.getProperty("line.separator"));
		for (c : caracteristicas) {
			sb.append(c).append(System.getProperty("line.separator"));
		}
		
		sb.append("- Lugares:").append(System.getProperty("line.separator"));
		for (l : lugares) {
			sb.append(l.nombre).append(System.getProperty("line.separator"));
		}
		
		sb.append("- Conexiones:").append(System.getProperty("line.separator"));
		for (c : conexiones) {
			sb.append(c.nombre).append(System.getProperty("line.separator"));
		}
		
		sb.toString
		
	}

}
