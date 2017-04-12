package carmenSanDiego

class EstadoVillano extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar, Villano villano, Villano ordenDeArresto) {
		//TODO: escribir los resultados como enunciado.
		if (!lugar.seEncuentraVillano) 
			"Peligro, el villano está en el país. Tené cuidado"
			
		else 
			detenerVillano(villano, ordenDeArresto)		
			
		}
	

	def detenerVillano(Villano villano, Villano ordenDeArresto){
		if(ordenDeArresto == null)
			//TODO: exception?
			
		if (villano.nombre == ordenDeArresto.nombre) 
				"ALTO!!! Detengase: " + villano.nombre				
			
		else
				"Malas noticias :( ..."
		
				
	}

}
