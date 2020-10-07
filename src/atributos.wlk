import wollok.game.*

class Atributo{

    var nivel 

    const property position

    method aumentar(cantidad){
        nivel = 100.min(nivel + cantidad)
    }


    method disminuir(cant){
        nivel = 0.max(nivel - cant)
    }

    method nivel() = nivel

    //method image()
}


