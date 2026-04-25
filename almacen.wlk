import camion.*

object almacen{
    const cosas = []
    method almacenamiento(){
        return cosas
    }
    method almacenar(cosasADejar){
        cosas.addAll(cosasADejar)
    }
}