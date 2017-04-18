package carmenSanDiego

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

class Caso {

	@Accessors Villano responsable
	@Accessors ArrayList<Pais> planDeEscape
	@Accessors String objeto
	@Accessors Pais paisDelRobo
	@Accessors String reporte

	new(Villano responsable, String objeto, ArrayList<Pais> planDeEscape, Pais paisDelRobo) {
		this.responsable = responsable
		this.objeto = objeto
		this.planDeEscape = planDeEscape
		this.paisDelRobo = paisDelRobo
		reporte()
	}

	def reporte() {
		reporte = "¡¡¡Ha desaparecido " + objeto + "!!! Se encontraba 
en exposición en el Museo Nacional de " + paisDelRobo.nombre + ".
 El criminal fue muy prolijo y la escena del crimen no contaba
 con pista alguna, su misión como detective es descifrar el 
responsable de tal crimen y apresarlo."
	}
}
