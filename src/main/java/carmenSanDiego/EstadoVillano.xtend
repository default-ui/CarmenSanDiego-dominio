package carmenSanDiego

/**
 * El villano está en el país
 */
class EstadoVillano extends EstadoOcupante {

	/**
	 * Si el villano se encuentra en el lugar intenta arrestarlo.
	 * Si no se encuentra en el lugar avisa que se encuentra en el país
	 */
	override responder(Pais siguienteDestino, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
	
		if (lugar.seEncuentraVillano==true) 
			detenerVillano(villano, ordenDeArresto, lugar)
		else 
			"Peligro, el villano está en el país. Tené cuidado"
			
	}

	/**
	 * Devuelve un mensaje distinto dependiendo de:
	 * - no existe la orden de arresto
	 * - la orden de arresto corresponde al villano
	 * - la orden de arresto no corresponde al villano
	 */
	def private detenerVillano(Villano villano, OrdenDeArresto ordenDeArresto, Lugar lugar){
		
		var String resultado = "ALTO!!! Detengase"
		
		if(ordenDeArresto !== null){
			if(villano.nombre == ordenDeArresto.villano.nombre){
				lugar.hayDetenido
			}
			resultado = resultado + ": " + ordenDeArresto.villano.nombre + "."
		}
	
		
		resultado
				
	}

}
