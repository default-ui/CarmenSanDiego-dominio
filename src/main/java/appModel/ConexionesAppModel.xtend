package appModel


import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.CarmenSanDiegoRepo
import carmenSanDiego.Pais

@Observable
@Transactional
@Accessors
class ConexionesAppModel{
	
	Pais conexionAEliminar
	Pais conexion
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repositorio){
		repo=repositorio
	}
	def agregarConexion() {
		repo.paisTemp.agregarConexion(conexion)
	}
	
	def eliminarConexion() {
		repo.paisTemp.eliminarConexion(conexionAEliminar)
	}
	
	def getPathImagenConexiones(){
		"conexiones.png"
	}
	
}