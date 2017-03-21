package carmenSanDiego

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

class Caso {

	@Accessors Villano responsable
	@Accessors String reporte
	@Accessors ArrayList<Pais> planDeEscape
	@Accessors String objeto
	@Accessors Pais paisDelRobo

	new(Villano responsable, String reporte, ArrayList<Pais> planDeEscape, String objeto, Pais paisDelRobo) {

		this.responsable = responsable
		this.reporte = reporte
		this.planDeEscape = planDeEscape
		this.objeto = objeto
		this.paisDelRobo = paisDelRobo
	}

}
