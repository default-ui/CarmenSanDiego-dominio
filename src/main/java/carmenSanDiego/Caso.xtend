package carmenSanDiego

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

class Caso {

	@Accessors Villano responsable
	@Accessors String reporte
	@Accessors ArrayList<Pais> planDeEscape
	@Accessors String objeto
	@Accessors Pais paisDelRobo

	new(Villano responsable, String objeto, ArrayList<Pais> planDeEscape, Pais paisDelRobo) {

		this.responsable = responsable
		this.planDeEscape = planDeEscape
		this.objeto = objeto
		this.paisDelRobo = paisDelRobo
		this.reporte = generarReporte(paisDelRobo.nombre, objeto)
	}
	
	def generarReporte(String nombrePais, String objeto) {
		return "Ha desaparecido "+objeto+"!!!. Se encontraba en exposici�n en el Museo Nacional de "+nombrePais+". El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misi�n como detective es desifrar el responsable de tal cr�men y apresarlo."
	}
}
