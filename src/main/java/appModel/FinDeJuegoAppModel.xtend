package appModel

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.Transactional
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.CarmenSanDiegoRepo

@Transactional
@Observable
@Accessors
class FinDeJuegoAppModel {
	
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo) {
		this.repo = repo
	}
	
	
	def getPathImagenLost(){
		"lost.png"
	}
	
	def getPathImagenWon(){
		"won.png"
	}
}