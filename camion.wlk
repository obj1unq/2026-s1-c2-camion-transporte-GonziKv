import cosas.*

object camion {
	const property cosas = #{}
	method cosas(){
		return cosas
	}
	method cargar(unaCosa) {
		if (cosas.contains(unaCosa)){
			self.error("No se puede cargar una cosa ya cargada")
		}else{
			cosas.add(unaCosa)
		}
		
	}
	method descargar(unaCosa){
		if (cosas.isEmpty() || not(cosas.contains(unaCosa))){
			self.error("No hay cosa a descargar")
		}else{
			cosas.remove(unaCosa)
		}
	}
	method esPesoPar(){
		return cosas.all({cosa => (cosa.peso()).even()})
	}
	method tieneCosaConPeso(peso){
		return cosas.any({cosa => cosa.peso() == peso})  
	}
	method peso(){
		return 1000 + cosas.sum({cosa => cosa.peso()})
	}
	method excesoDePeso(){
		return self.peso() > 2500
	}
	method cosaPeligrosaDeNivel(nivel){
		if (cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})){
			return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
		} else{
			self.error("no hay cosa con el nivel de peligrosidad dado")
		}
	}
	method cosasPeligrosasSuperiorA(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQue(cosaAComparar){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosaAComparar.nivelPeligrosidad()})
	}
}
