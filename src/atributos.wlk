class Atributo{

    var nivel 

    method aumentar(cantidad){

        nivel = 100.min(nivel + cantidad)
    }


    method disminuir(cant){
        nivel = 0.max(nivel - cant)
    }

    method nivel() = nivel
}


