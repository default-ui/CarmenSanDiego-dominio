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
		plan.add(pais)
		val pais2 = pais.obtenerConexionSinRepetidos(plan)
		plan.add(pais2)
		val pais3 = pais2.obtenerConexionSinRepetidos(plan)
		plan.add(pais3)
		val pais4 = pais3.obtenerConexionSinRepetidos(plan)
		plan.add(pais4)
		val pais5 = pais4.obtenerConexionSinRepetidos(plan)
		plan.add(pais5)
		val pais6 = pais5.obtenerConexionSinRepetidos(plan)
		plan.add(pais6)
		plan.remove(plan.indexOf(pais))
		return plan
	}
}
