package appModel

class PaisAppModel {
	def agregarPais(){
		validarCantidadLugares(temp.lugares.size)
		temp.nombre = nuevoPaisNombre
		mapa.paises.add(temp)
	}
}