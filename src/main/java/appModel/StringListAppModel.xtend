package appModel

import org.uqbar.commons.utils.Observable
import java.util.List

class StringListAppModel {
	
	Observable listOwner
	String property
	List<String> strings
	
	
	new(Observable listOwnerObject, String objectProperty, List<String> stringList){
		listOwner = listOwnerObject
		property = objectProperty
		strings = stringList
	}


}