package miniModel

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import carmenSanDiego.Expediente
import carmenSanDiego.Villano

@Accessors
class MiniExpediente {
	List<MiniVillano> villanos
	
	new (Expediente expediente) {
		this.villanos = expediente.villanos.reducirVillanos();
	}
	
	def reducirVillanos(List<Villano> villanos) {
		villanos.map([it.toMiniVillano])
	}
	
	def toMiniVillano(Villano villano) {
		new MiniVillano(villano)
	}
}