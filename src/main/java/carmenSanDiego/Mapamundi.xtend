package carmenSanDiego

import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

import static utils.FileParser.*

class Mapamundi {

	@Accessors val paises = <Pais>newArrayList()
	private var Pais paisDelRobo

	def nuevoPais(String nombre) {
		val pais = new Pais(nombre)
		this.paises.add(pais)
	}

	def eliminarPais(String nombre) {
		this.paises = paises.filter([p | p.nombre != nombre]).toList
	}

	def editarPais(String nombre) {
		this.eliminarPais(nombre)
		this.nuevoPais(nombre)
	}

	def Pais obtenerPaisDelRobo() {
        if (paisDelRobo == null) paisDelRobo = randomPais()
        return paisDelRobo
	}
	
	/**
	 * Retorna una lista de paises, con sus caracteristicas
	 * Los datos los obtiene de un archivo CSV
	 */
	def private cargarPaisesYCaracteristicas(){
		
		var listaPaises = new ArrayList()
		
		// armo una lista con todos los datos de los paises, un pais por linea
		var listaPaisesDatos = getListFromFile('src/main/resources/datapaises.csv')
		for (datosPais : listaPaisesDatos) {
			
			// separo la linea en una nueva lista
			var listaDatosPais = new LinkedList(datosPais.split(','))
			
			// creo un pais, el nombre es el primer elemento de la lista			
			var nuevoPais = new Pais(listaDatosPais.remove(0))
			
			for (caracteristica : listaDatosPais) {
				nuevoPais.agregarCaracteristica(caracteristica)
			}
			
			listaPaises.add(nuevoPais)
		}
		
		listaPaises
	}

    def private Pais randomPais(){
        paises.get(new Random().nextInt(paises.size()))
    }

	/**
	 * Genera un listado de paises con conexiones aleatorias entre ellos
	 */
	def generarMapamundiAleatorio() {
		
		var listadoPaises = cargarPaisesYCaracteristicas
		
		// agrego las conexiones a cada pais
		for (paisActual : listadoPaises) {
			
			// genero una nueva lista de paises sin el pais actual
			var paisesMenosPaisActual = new ArrayList<Pais>(listadoPaises)
			paisesMenosPaisActual.remove(paisActual)
			
			// conecto el pais actual con otros 3
			while(paisActual.conexiones.size < 3) {
				
				// elijo el pais con el que generar la conexion
				// TODO: deberia ser un pais que tambien tenga menos de 3 conexiones
				var paisAConectar = paisesMenosPaisActual.get(new Random().nextInt(paisesMenosPaisActual.size()))
				 
				// genero conexion en ambos sentidos
				paisActual.agregarConexion(paisAConectar)
			}
			
			paises.add(paisActual)
			
		}

	}

}
