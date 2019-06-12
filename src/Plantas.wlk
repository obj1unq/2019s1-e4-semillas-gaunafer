import semillas.*
import Parcelas.*
class Planta {
	var property anoDeObtencion
	var property alturaDeLaPlanta
	
	
	constructor (_altura, _anoDeObtencion) {
		anoDeObtencion = _anoDeObtencion	
		alturaDeLaPlanta = _altura
	}
	method horasDeSolToleradas() = {}
	method cumpleCondicionAlternativa() = false
	method esFuerte() {
		return self.horasDeSolToleradas() > 10
	}

	method cuantoOcupa(){
		
	}
	
	method daSemillas() {
		return self.esFuerte() or self.cumpleCondicionAlternativa()
	}
}

class Menta inherits Planta{
	override method horasDeSolToleradas() {
		return 6
	}
	
	override method cumpleCondicionAlternativa() {
		return self.alturaDeLaPlanta() > 0.4
	}
	method espacioQueOcupa() {
		return self.alturaDeLaPlanta() * 3
	}
	method esParcelaIdeal(_parcela) {
		return _parcela.superficie() > 6
		
	}
	
	
}
class Soja inherits Planta{
	override method horasDeSolToleradas() {
		if (self.alturaDeLaPlanta() < 0.5) {
			return 6
		}else if (self.alturaDeLaPlanta() >= 0.5 and self.alturaDeLaPlanta() < 1){
			return 7
		}else {
			return 9
		}
	}
		
	method esParcelaIdeal(_parcela) {
		return _parcela.horasDeSolQueRecibe() == self.horasDeSolToleradas()
	}
	method semillaJoven() {
		return self.anoDeObtencion() > 2017
	}
	override method cumpleCondicionAlternativa() {
		return self.semillaJoven() and self.alturaDeLaPlanta() > 1
	}
	method espacioQueOcupa() {
		return self.alturaDeLaPlanta() / 2
	}
	
	
	
}

class Quinoa inherits Planta {
	var property horasDeSolToleradas	
	override method horasDeSolToleradas() {
		return horasDeSolToleradas
	}
	method espacioQueOcupa() {
		return 0.5
	}
	override method cumpleCondicionAlternativa() {
		return anoDeObtencion < 2005
	}
	method esParcelaIdeal(_parcela) {
		return _parcela.plantaMasAlta() <= 1.5
		
	}
}
///	method daSemillas() {}

class SojaTransgenica inherits Soja{
	override method daSemillas() = false
	override method esParcelaIdeal(_parcela) {
		return _parcela.cantidadDePlantasSembradas() <= 1
	}
}
class HierbaBuena inherits Menta {
	override method espacioQueOcupa() {
		return self.alturaDeLaPlanta() * 6
	}
}

