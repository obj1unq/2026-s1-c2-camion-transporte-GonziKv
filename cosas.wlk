object knightRider {
	method peso(){
		return 500 
		}
	method nivelPeligrosidad(){
		return 10 
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
}
object bumblebee{
	var modo = null
	method modo(_modo){
		modo = _modo
	}
	method peso(){
		return 800
	}
	method nivelPeligrosidad(){
		return modo.nivelPeligro()
	}
}
object auto{
	method nivelPeligro(){
		return 15
	}
}
object robot{
	method nivelPeligro(){
		return 30
	}
}
object paqueteLadrillos{
	var cantidad = 0
	method cantidad(_cantidad){
		cantidad = _cantidad
	}
	method peso(){
		return 2 * cantidad
	}
	method nivelPeligrosidad(){
		return 2
	}
}
object bateriaAA{
	var tieneMisiles = false
	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
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
}