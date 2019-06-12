import Plantas.*
import semillas.*
object parcelaEcologica {
	method seAsociaBien(_parcela, _planta) {
		return not _parcela.tieneComplicaciones() and _planta.esParcelaIdeal(_parcela)
	}	
}
object parcelaIndustrial {
	method seAsociaBien(_parcela, _planta) {
		return _parcela.cantidadDePlantasSembradas() >= 2 and _planta.esfuerte()
	}
}
class Parcelas {
	var property tipoDeParcela
	var property ancho
	var property largo
	var property horasDeSolQueRecibe
	var plantas = []
	method plantaMasAlta() {
		return (plantas.map{planta => planta.alturaDeLaPlanta()}).max()
	}
	method superficie(){
		return ancho * largo
	}
	method cantidadDePlantasQueEntran() {
		if (ancho > largo) {
			return self.superficie() / 5
		}else {
			return self.superficie() / 3 + largo
		}
	}
	method cantidadDePlantasSembradas() {
		return plantas.lenght()
	}
	method tieneComplicaciones() {
		plantas.any {planta => planta.horasDeSolQueTolera() < self.horasDeSolQueRecibe()}
	}

	method plantar(_planta) {
		if (not self.sePuedeAgregarUnaPlanta() or not self.laPlantaEsApta(_planta)) {
			self.error("No se puede sembrar esa planta en este cantero")
		}else {
			plantas.add(_planta)
		}
	}
	
	method sePuedeAgregarUnaPlanta() {
		return self.cantidadDePlantasQueEntran() >= plantas.length() + 1
	}
	method laPlantaEsApta(_planta) {
		return _planta.horasDeSolQueTolera() >= self.horasDeSolQueRecibe() - 2
	}
	method seAsociaBien(_planta) {
		tipoDeParcela.seAsociaBien(self,_planta)
	}
	method cantidadDePlantasBienAsociadas() {
		return plantas.filter{planta => self.seAsociaBien(planta)}.length()
	}
	method porcentajeDePlantasBienAsociadas(){
		return (self.cantidadDePlantasBienAsociadas() * 100) / self.cantidadDePlantasSembradas()
	}
}

