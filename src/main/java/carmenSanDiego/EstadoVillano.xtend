package carmenSanDiego

/**
 * El villano está en el país
 */
class EstadoVillano extends EstadoOcupante {

	/**
	 * Si el villano se encuentra en el lugar intenta arrestarlo.
	 * Si no se encuentra en el lugar avisa que se encuentra en el país
	 */
	override responder(Pais pais, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
	
		//TODO: escribir los resultados como enunciado.
		if (!lugar.seEncuentraVillano) 
			"Peligro, el villano está en el país. Tené cuidado"
		else 
			detenerVillano(villano, ordenDeArresto)
			
	}

	def private detenerVillano(Villano villano, OrdenDeArresto ordenDeArresto){
		
		var String resultado
		
		if(ordenDeArresto == null)
			resultado = "El villano ha sido liberado por el juez por no tener orden de arresto"
		else {
			if (villano.nombre == ordenDeArresto.villano.nombre)
				resultado = "Ha detenido a " + villano.nombre+" con exito!!!"					
			else
				resultado = "El villano ha sido liberado por el juez por tener orden de arresto incorrecta"				
		}
		
		resultado
				
	}

}
