package carmenSanDiego

import java.util.ArrayList
import java.util.LinkedList
import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static utils.FileParser.*

@Observable
class Mapamundi {

	@Accessors var List<Pais> paises = <Pais>newArrayList()
	private var Pais paisDelRobo
	@Accessors Random randomGen = new Random() 

	/** Crea un pais nuevo y lo agrega al mapamundi*/
	def nuevoPais(String nombre) {
		val pais = new Pais(nombre)
		paises.add(pais)
	}
	
	/**Elimina el pais del mapamundi */
	def eliminarPais(String name) {
		paises.remove(getPaisFromName(name))
	}	
	
	/** Reemplaza el pais por su modificacion */
	def editarPais(String nombre, String nuevoNombre) {
		eliminarPais(nombre)
		nuevoPais(nuevoNombre)
	}
	
	/** Retorna el pais donde se efectuo el robo */
	def Pais obtenerPaisDelRobo() {
        	paisDelRobo = randomPais()        	
       
        paisDelRobo
        
	}
	
	/**
	 * Retorna una lista de paises, con sus caracteristicas
	 * Los datos los obtiene de un archivo CSV
	 */
	def private cargarPaisesYCaracteristicas(){
		
		var listaPaises = new ArrayList()
		
		// armo una lista con todos los datos de los paises, un pais por linea
		var listaPaisesDatos = getListFromFile('/dataPaises.csv')
		for (datosPais : listaPaisesDatos) {
			
			// separo la linea en una nueva lista
			var listaDatosPais = new LinkedList(datosPais.split(','))
			
			// creo un pais, el nombre es el primer elemento de la lista			
			var nuevoPais = new Pais(listaDatosPais.remove(0))
			
			//agrego los lugares a los paises (son los primeros 3 entries desp. del nombre)
			for(var i = 0; i < 3; i ++){
				nuevoPais.lugares.add(crearLugar(listaDatosPais.remove(0)))	
			}
			
			for (caracteristica : listaDatosPais) {
				nuevoPais.agregarCaracteristica(caracteristica)
			}
			
			listaPaises.add(nuevoPais)
		}
		
		listaPaises
	}

	/**
	 * Retorna un pais aleatorio entre la lista de paises
	 */
    def private Pais randomPais(){
        paises.get(randomGen.nextInt(paises.size()))
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
				var paisAConectar = paisesMenosPaisActual.get(randomGen.nextInt(paisesMenosPaisActual.size()))
				paisesMenosPaisActual.remove(paisAConectar)
				 
				// genero conexion en ambos sentidos
				paisActual.agregarConexion(paisAConectar)
			}
			
			paises.add(paisActual)
			
		}

	}
	
	/**
	 * Crea un lugar a partir del nombre de su clase
	 * (el cual se encuentra en el archivo src/main/resources/dataPaises.csv )
	 */
	def private crearLugar(String nombreLugar){
	  var lugar =  Class.forName(nombreLugar).getConstructor().newInstance() as Lugar
	  lugar
	}
	
	def getPaisFromName(String nombre){
		for(Pais p : this.paises) {
        	if(p.nombre.equals(nombre)) {
            	return p
			}
		}
	}

}
