import wollok.game.*

class Atributo{

    var property nivel 
    const property position

    method aumentar(cantidad){

        nivel = 100.min(nivel + cantidad)
    }


    method disminuir(cantidad){

        nivel = 0.max(nivel - cantidad)
    }

   

    //method image()
}

const  energia = new Atributo(nivel = 100, position = game.at(2,19))
const  hambre = new Atributo(nivel = 100, position = game.at(4,19))
const  cordura = new Atributo(nivel = 100, position = game.at(6,19))
const  higiene = new Atributo(nivel = 100, position = game.at(8,19))
const  estudio = new Atributo(nivel = 0, position = game.at(10, 19))
const  ganasDeIrAlBanio = new Atributo(nivel = 100, position = game.at(12, 19))