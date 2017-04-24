package carmenSanDiego

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
class Caso {

	@Accessors Villano responsable
	@Accessors List<Pais> planDeEscape
	@Accessors String objeto
	@Accessors Pais paisDelRobo
	@Accessors List<String> reporte

	new(Villano responsable, String objeto, List<Pais> planDeEscape, Pais paisDelRobo) {
		
		this.responsable = responsable
		this.objeto = objeto
		this.planDeEscape = planDeEscape
		this.paisDelRobo = paisDelRobo
		
		generarReporte
	}

	def private void generarReporte() {
		reporte = newArrayList
		reporte.add("¡¡¡Ha desaparecido " + objeto + "!!!")
		reporte.add("Se encontraba en exposición en el Museo Nacional de " + paisDelRobo.nombre + ".")
		reporte.add("El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna.")
		reporte.add("Su misión como detective es descifrar el responsable de tal crimen y apresarlo.")
	}
}
