package miniModel

import java.util.List
import carmenSanDiego.Pais
import org.eclipse.xtend.lib.annotations.Accessors

/*
 * Clase cuyo proposito es ser un intermediario entre un JSON de un Pais y una instancia de Pais
 */

@Accessors
class DataPais {
	
	Integer id
	String nombre
	List<String> caracteristicas = <String>newArrayList()
	List<MiniPais> conexiones = <MiniPais>newArrayList()
	List<String> lugares = <String>newArrayList()
	
	new(){
		this.id = 0
		this.nombre = ""
		this.caracteristicas = <String>newArrayList()
		this.conexiones = <MiniPais>newArrayList()
		this.lugares = <String>newArrayList()
	}
	
}