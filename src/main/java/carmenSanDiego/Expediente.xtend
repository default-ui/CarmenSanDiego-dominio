package carmenSanDiego

import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

import static utils.FileParser.*
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Expediente {

	var List<Villano> villanos = <Villano>newArrayList()
	Random randomGen = new Random()

	def void nuevoVillano(Integer id, String nombre, Sexo sexo) {
		val villano = new Villano(id, nombre, sexo)
		this.villanos.add(villano)
	}

	def agregarVillano(Villano vil){
		villanos.add(vil)
	}

	def void eliminarVillano(String villanoNombre) {
		this.villanos = villanos.filter([v | v.nombre != villanoNombre]).toList
	}
	
	def getVillano(int id) {
		for(Villano villano : this.villanos) {
			if (villano.getId == id) return villano
		}
	}
	
	/**
	 * Obtiene un villano aleatorio del expediente
	 */
	def Villano obtenerVillano() {
		villanos.get(randomGen.nextInt(villanos.size()))
	}

	/**
	 * Genera un listado de villanos con caracteristicas aleatorias
	 */
	def void generarExpedienteAleatorio() {
		
		val listaVillanos = obtenerVillanos()
	
		for (i : 0 ..< listaVillanos.size) {
			
			// creo el nuevo villano usando datos de la lista de villanos			
			val List<String> datosNuevoVillano = listaVillanos.get(i).split("  ")
			var villano = new Villano(i+1, datosNuevoVillano.get(0), Sexo.valueOf(datosNuevoVillano.get(1)))
			// agrego senas particulares segun orden de archivos csv
			//for(var k = 2; datosNuevoVillano.size > k; k++){
			for(var k = 2; 6 > k; k++){
				villano.agregarSena(datosNuevoVillano.get(k))}
			// consigo 5 caracteristicas para el villano nuevo	
			for(var k = 6; datosNuevoVillano.size > k; k++){
				villano.agregarHobbie(datosNuevoVillano.get(k))
			}
			
			villanos.add(villano)
		}
	}
	
	def private obtenerVillanos() {
		getListFromFile("/dataVillanos.csv")
	}

	override toString() {
		
		var sb = new StringBuilder();
		
		sb.append("-- Expediente --").append(System.getProperty("line.separator"));
		
		sb.append("- Villanos de Expediente:").append(System.getProperty("line.separator"));
		for (v : villanos) {
			sb.append(v).append(System.getProperty("line.separator"));
		}
		
		sb.append("-- Fin Expediente --").append(System.getProperty("line.separator"));
		
		sb.toString
				
	}
	
	def getVillanoById(Integer id) {
		this.villanos.findFirst([it.id == id])
	}
	
	def eliminarVillanoConId(Integer id) {
		villanos.remove(getVillanoById(id))
	}
	
	def reemplazarVillanoConId(Integer id, Villano villano) {
		eliminarVillanoConId(id)
		agregarVillano(villano)
	}
	
}
