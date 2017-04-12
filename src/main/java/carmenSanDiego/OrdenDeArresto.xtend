package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors

class OrdenDeArresto {
	
	@Accessors Villano villano
	
	new(Villano villano) {
		this.villano = villano
	}
	
}