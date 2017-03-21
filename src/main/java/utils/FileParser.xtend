package utils

import java.io.BufferedReader
import java.io.FileReader
import java.util.ArrayList

class FileParser {
	
	def static getListFromFile(String filePath) {
		
        val reader = new BufferedReader(new FileReader(filePath))
		val lines = new ArrayList()
		var String line		
		
		while ((line = reader.readLine()) !== null) {
    		lines.add(line);
    	}
    	
    	lines
    	
	}
	
}