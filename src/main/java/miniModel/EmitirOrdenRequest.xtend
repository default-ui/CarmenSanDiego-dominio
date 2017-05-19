package miniModel

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EmitirOrdenRequest {
	
  Integer villanoId
  Integer casoId
  
  new () {
  	villanoId = 0
  	casoId = 0
  }
  
}
