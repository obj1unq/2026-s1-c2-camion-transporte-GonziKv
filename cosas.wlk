import modosDeBumblebee.*
object knightRider {
	method peso(){
		return 500 
		}
	method nivelPeligrosidad(){
		return 10 
		}
	method bultos(){
		return 1
	}
	method sufrirAccidente(){
	}
}
object arenaAGranel{
	var peso = 0
	method peso(_peso){
		peso = _peso
	}
	method peso(){
		return peso
	}
	method nivelPeligrosidad(){
		return 1
	}
	method bultos(){
		return 1
	}
	method sufrirAccidente(){
		peso = peso + 20
	}
}
object bumblebee{
	var modo = null
	method modo(_modo){
		modo = _modo
	}
	method peso(){
		return 800
	}
	method modo(){
		return modo
	}
	method nivelPeligrosidad(){
		return modo.nivelPeligro()
	}
	method bultos(){
		return 2
	}
	method sufrirAccidente(){
		modo = modo.transformarse()
	}
}

object paqueteLadrillos{
	var cantidad = 0
	method cantidad(_cantidad){
		cantidad = _cantidad
	}
	method cantidad(){
		return cantidad
	}
	method peso(){
		return 2 * cantidad
	}
	method nivelPeligrosidad(){
		return 2
	}
	method bultos(){
		if (cantidad <= 100){
			return 1
		}
		else if (cantidad <= 300){
			return 2
		}
		else{
			return 3
		}
		
	}
	method sufrirAccidente(){
		if (cantidad <= 12){
			cantidad = 0
		} else {
			cantidad = cantidad - 12
		}
	}
}
object bateriaAA{
	var tieneMisiles = false
	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
	}
	method tieneMisiles(){
		return tieneMisiles
	}
	method peso(){
		if (tieneMisiles) {
			return 300
		} else {
			return 200
		}
	}
	method nivelPeligrosidad(){
		if (tieneMisiles){
			return 100
		} else {
			return 0
		}
	}
	method bultos(){
		if (tieneMisiles){
			return 2
		} else {
			return 1
		} 
	}
	method sufrirAccidente(){
		tieneMisiles = false
	}
}
object residuosRadiactivos{
	var peso = 0
	method peso(_peso){
		peso = _peso
	}
	method peso(){
		return peso
	}
	method nivelPeligrosidad(){
		return 200
	}
	method bultos(){
		return 1
	}
	method sufrirAccidente(){
		peso = peso + 15
	}
}
object contenedorPortuario{
	const cosas = []
	method agregarCosa(unaCosa){
		cosas.add(unaCosa)
	}
	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad(){
		if (cosas.isEmpty()){
			return 0
		} else {
			return (self.cosaMasPeligrosa()).nivelPeligrosidad()
		}
	}
	method cosaMasPeligrosa(){
		return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
	method bultos(){
		return 1 + cosas.sum({cosa => cosa.bultos()})
	}
	method sufrirAccidente(){
		cosas.forEach({cosa => cosa.sufrirAccidente()})
	}
}
object embalajeSeguridad{  
	var cosa = null
	method cosa(_cosa){
		cosa = _cosa
	}
	method peso(){
		return cosa.peso()
	}
	method nivelPeligrosidad(){
		return cosa.nivelPeligrosidad() * 0.5
	}
	method bultos(){
		return 2
	}
	method sufrirAccidente(){
	}
}