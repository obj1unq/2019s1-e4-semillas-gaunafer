import Plantas.*
import Parcelas.*
object inta {
	var property parcelas = []
	method promedioDePlantas(){
		return parcelas.map{parcela => parcela.cantidadDePlantasSembradas()}.sum() / parcelas.length()
	}
	method parcelaMasAutoSustentable() {
		self.parcelasConMasDeCuatroPlantas().max({parcela => parcela.porcentajeDePlantasBienAsociadas()})
	}
	method parcelasConMasDeCuatroPlantas(){
		return parcelas.filter{parcela => parcela.lenght() > 4}
	}
}
