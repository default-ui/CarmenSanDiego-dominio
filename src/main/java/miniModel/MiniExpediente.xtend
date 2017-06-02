package miniModel

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import carmenSanDiego.Expediente
import carmenSanDiego.Villano

@Accessors
class MiniExpediente {
	List<MiniVillano> villanos
	List<MiniVillanoConCaracateristicas> villanosCaracteristicas
	
	new (Expediente expediente) {
		this.villanos = expediente.villanos.reducirVillanos()
		this.villanosCaracteristicas = expediente.villanos.reducirVillanosCaracteristicas()
	}
	
	def reducirVillanosCaracteristicas(List<Villano> villanos){
		villanos.map([it.toMiniVillanoConCaracteristicas])
	}
	
	def reducirVillanos(List<Villano> villanos) {
		villanos.map([it.toMiniVillano])
	}
	
	def toMiniVillano(Villano villano) {
		new MiniVillano(villano)
	}
	
	def toMiniVillanoConCaracteristicas(Villano villano) {
		new MiniVillanoConCaracateristicas(villano)
	}
	
		
	def getVillanoById(Integer id){
		for(v : villanosCaracteristicas) {
        	if(v.id.equals(id)) {
        		return v
			}
		}
	}
}