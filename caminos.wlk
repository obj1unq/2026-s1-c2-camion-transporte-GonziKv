object ruta9{
    method verificarViaje(vehiculo){
        if (not(vehiculo.puedeCircularEnRuta(20))){
            self.error("No se puede circular en esta ruta")
        }
    }
}
object caminoVecinal{
    var pesoMaximo = 0
    method pesoMaximo(_pesoMaximo){
        pesoMaximo = _pesoMaximo
    }
    method verificarViaje(vehiculo){
        if (vehiculo.peso() > pesoMaximo){
            self.error("No se puede circular a traves de esta ruta")
        }
    }
}