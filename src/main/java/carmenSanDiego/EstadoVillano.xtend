package carmenSanDiego

class EstadoVillano extends EstadoOcupante {

	override responder(Pais pais, Lugar lugar, Villano villano, Villano ordenDeArresto) {
		
		if (!lugar.seEncuentraVillano) {
			"Peligro, el villano está en el país. Tené cuidado"
			
		} else {
			if (villano.nombre == ordenDeArresto.nombre) {
				"ALTO!!! Detengase: " + villano.nombre				
			}
		}
	}


}
