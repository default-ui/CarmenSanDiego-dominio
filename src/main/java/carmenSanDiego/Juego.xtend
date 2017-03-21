package carmenSanDiego

import java.util.ArrayList

class Juego {
	Mapamundi mapa
	Expediente expediente

	new(Mapamundi mapa, Expediente expediente) {
		this.mapa = mapa
		this.expediente = expediente
	}

	def Caso crearCaso() {
		val Pais paisDelRobo = obtenerPaisDelRobo()
		val planDeEscape = obtenerPlanDeEscape(paisDelRobo)
		val responsable = obtenerVillano()

		new Caso(
			responsable,
			paisDelRobo.reporte,
			planDeEscape,
			paisDelRobo.objeto,
			paisDelRobo
		)
	}

	def obtenerVillano() {
		this.expediente.obtenerVillano()
	}

	def obtenerPaisDelRobo() {
		this.mapa.obtenerPaisDelRobo()
	}

	def ArrayList<Pais> obtenerPlanDeEscape(Pais pais) {
		val plan = <Pais>newArrayList()
		val estadoInf = new EstadoInformante
		val estadoVil = new EstadoVillano
		pais.setEstado(estadoInf)
		plan.add(pais)
		val pais2 = pais.obtenerConexionSinRepetidos(plan)
		pais2.setEstado(estadoInf)
		plan.add(pais2)
		val pais3 = pais2.obtenerConexionSinRepetidos(plan)
		pais3.setEstado(estadoInf)
		plan.add(pais3)
		val pais4 = pais3.obtenerConexionSinRepetidos(plan)
		pais4.setEstado(estadoInf)
		plan.add(pais4)
		val pais5 = pais4.obtenerConexionSinRepetidos(plan)
		pais5.setEstado(estadoInf)
		plan.add(pais5)
		val pais6 = pais5.obtenerConexionSinRepetidos(plan)
		pais6.setEstado(estadoVil)
		plan.add(pais6)
		plan.remove(plan.indexOf(pais))
		return plan
	}
}
