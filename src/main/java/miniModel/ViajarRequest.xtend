package miniModel

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ViajarRequest {
	Integer destinoId
	Integer casoId
	
	new(){
		this.destinoId = 0
		this.casoId = 0
	}
	
}