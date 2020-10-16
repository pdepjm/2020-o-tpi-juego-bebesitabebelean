import wollok.game.*
import extras.*
import nivel.*

/*
Los Atributos:
 - Todos lo atributos tienen un nivel que va de 0 a 100 
 - Los atirbutos  pueden aumentarse o disminuirse
 - Todos se aumentan iguales (esto no lo pensamos en detalle, pero inventense una regla acá y ya)
 - Cada atributo puede ser Mental o Físico, esto influye en como se disminuye
             - Un atributo mental tiene distintos niveles, cuando está en nivel 1 al disminuir baja en X (elijan el X), si bajó mas de X% el nivel del atributo 
             en general pasa a ser de nivel 2 y eso hace que la persona enloquezca (cuando alguien enloquece, es decir pasa a nivel 2, se invierten los comportamientos 
              de las teclas de arriba y abajo) si baja mas de Y% pasa a ser nivel 3 y eso hace que se inviertan la iz y la derecha
             - Un atributo físico lo que hace es bajar el nivel, si baja de nivel hace que el personaje se mueva mas lento, si llega a 0 entonces perdiste el juego
*/

class Atributo inherits Visual{

    var tipoAtributo 
    var property nivelAtributo = 100

    method aumentar(cantidad){

        nivelAtributo = 100.min(nivelAtributo + cantidad)
        tipoAtributo.aumentarPotenciaEn(cantidad/2)
        tipoAtributo.evaluarPotencia()
    }


    method disminuir(cantidad){

        nivelAtributo = 0.max(nivelAtributo - cantidad)
        tipoAtributo.disminuirPotenciaEn(cantidad/2)
        tipoAtributo.evaluarPotencia()
    }
}

class TipoAtributo inherits Visual {

    var property potencia = 100
    var property nivelTipoAtributo

    method evaluarPotencia(){
        
        nivelTipoAtributo.cambiarNivelAtributoSegun(potencia, self)
    }

    method aumentarPotenciaEn(cantidad){
        potencia = 100.min(potencia + cantidad)
    }

    method disminuirPotenciaEn(cantidad){
        potencia = 0.max(potencia - cantidad)
    }
}


const fisico = new TipoAtributo(position = game.at(14,19), image = "pepito.png", nivelTipoAtributo = nivelFisico0)
const mental = new TipoAtributo(position = game.at(16,19), image = "pepito2.png", nivelTipoAtributo = nivelMental0)
const neutro = new TipoAtributo(position = game.at(-1,-1), image = "pepito3.png", nivelTipoAtributo = nivelNeutro)


object nivelNeutro{

    method cambiarNivelAtributoSegun(potencia, tipo){}
}
/*
object fisico{

    var property nivelFisico = nivelFisico0
     
    method evaluarNivel(cantidad){
        
        nivelFisico.cambiarNivelFisicoSegun(cantidad, self)
        nivelFisico.aplicarEfectos()
    }

}

object mental{

    var property nivelMental = nivelMental0

    method evaluarNivel(cantidad){

        nivelMental.cambiarNivelMentalSegun(cantidad, self)
        nivelMental.aplicarEfectos()
    }
}
*/

object nivelMental0{

    //method aplicarEfectos(){config.configuracionInicial()}

    method cambiarNivelAtributoSegun(potencia, tipo){

        if(potencia < 70) tipo.nivelTipoAtributo(nivelMental1)
    }
}

object nivelMental1{

    //method aplicarEfectos(){config.configuracionLoco1()}

    method cambiarNivelAtributoSegun(potencia, tipo){

        if(potencia < 40) tipo.nivelTipoAtributo(nivelMental2)
        else if(potencia >= 70) tipo.nivelTipoAtributo(nivelMental0)
    }
}

object nivelMental2{

    //method aplicarEfectos(){config.configuracionLoco2()}

    method cambiarNivelAtributoSegun(potencia, tipo){
        /*
        if(potencia < 10) tipo.nivel(nivelMental3)
        else if(potencia >= 40) tipo.nivel(nivelMental1)
        */

        if(potencia >= 40)
            tipo.nivelTipoAtributo(nivelMental1)
    }
}


/*

object nivelMental3{

    method aplicarEfectos(){config.configuracionLoco3()}

    method cambiarNivelAtributoSegun(potencia, tipo){

        if(potencia >= 10) tipo.nivel(nivelMental2)
    }
}
*/


object nivelFisico0{
    
    //method aplicarEfectos(){config.configuracionInicial()}

    method cambiarNivelAtributoSegun(potencia, tipo){

        if(potencia < 50) tipo.nivelTipoAtributo(nivelFisico1)
    }
}

object nivelFisico1{
    
    //method aplicarEfectos(){config.configuracionCansado()}

    method cambiarNivelAtributoSegun(potencia, tipo){

        if(potencia >= 50) tipo.nivelTipoAtributo(nivelFisico0)
    }
}


const  energia = new Atributo(position = game.at(2,19), image = "Energia_editado.png", tipoAtributo = fisico)
const  hambre = new Atributo(position = game.at(4,19), image = "Hambre_editado.png", tipoAtributo = fisico)
const  cordura = new Atributo(position = game.at(6,19), image = "Cordura.png", tipoAtributo = mental)
const  higiene = new Atributo(position = game.at(8,19), image = "Higiene_editado.png", tipoAtributo = fisico)
const  estudio = new Atributo(nivelAtributo = 0, position = game.at(10, 19), image = "Estudio_editado.png", tipoAtributo = neutro)
const  ganasDeIrAlBanio = new Atributo(position = game.at(12, 19), image = "Ganas_de_ir_al_banio_editado.png", tipoAtributo = fisico)


