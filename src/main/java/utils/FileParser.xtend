package utils

import java.io.BufferedReader
import java.io.InputStreamReader
import java.util.ArrayList

class FileParser {
	
	/**
	 * Obtiene un listado de strings con el contenido del archivo
	 */
	def static getListFromFile(String filePath) {
		
		val in = FileParser.getResourceAsStream(filePath)
		
        val reader = new BufferedReader(new InputStreamReader(in))
		val lines = new ArrayList()
		var String line
		
		while ((line = reader.readLine()) !== null) {
    		lines.add(line);
    	}
    	
    	lines
    	
	}
	
}