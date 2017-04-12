package carmenSanDiego

class EstadoVillano extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar, Villano villano, OrdenDeArresto ordenDeArresto) {
		//TODO: escribir los resultados como enunciado.
		if (!lugar.seEncuentraVillano) 
			"Peligro, el villano está en el país. Tené cuidado"
			
		else 
			detenerVillano(villano, ordenDeArresto)		
			
		}
	

	def detenerVillano(Villano villano, OrdenDeArresto ordenDeArresto){
		if(ordenDeArresto == null)
			return "El villano ha sido liberado por el juez por no tener oren de arresto"
			
		if (villano.nombre == ordenDeArresto.villano.nombre) 
				"ALTO!!! Detengase: " + villano.nombre				
			
		else
				"Malas noticias :( ..."
		
				
	}

}
