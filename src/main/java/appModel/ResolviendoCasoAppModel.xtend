package appModel

import org.uqbar.commons.utils.Transactional
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import carmenSanDiego.CarmenSanDiegoRepo

@Transactional
@Observable
@Accessors
class ResolviendoCasoAppModel {
	
	CarmenSanDiegoRepo repo
	
	new(CarmenSanDiegoRepo repo) {
		this.repo = repo
	}
}