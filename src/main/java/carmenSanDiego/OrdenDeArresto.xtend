package carmenSanDiego

import org.eclipse.xtend.lib.annotations.Accessors

class OrdenDeArresto {
	@Accessors Villano villanoOrden
	
	new(Villano villano){
		this.villanoOrden = villano
	}
	
	
}
