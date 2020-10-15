import wollok.game.*
import extras.*
import nivel.*


/*
Los Atributos:
 - Todos lo atributos tienen un nivel que va de 0 a 100 
 - Los atirbutos  pueden aumentarse o disminuirse
 - Todos se aumentan iguales (esto no lo pensamos en detalle, pero inventense una regla acá y ya)           NOOOOO ESTO NOOOOOOO
 - Cada atributo puede ser Mental o Físico, esto influye en como se disminuye
             - Un atributo mental tiene distintos niveles, cuando está en nivel 1 al disminuir baja en X (elijan el X), si bajó mas de X% el nivel del atributo 
             en general pasa a ser de nivel 2 y eso hace que la persona enloquezca (cuando alguien enloquece, es decir pasa a nivel 2, se invierten los comportamientos 
              de las teclas de arriba y abajo) si baja mas de Y% pasa a ser nivel 3 y eso hace que se inviertan la iz y la derecha
             - Un atributo físico lo que hace es bajar el nivel, si baja de nivel hace que el personaje se mueva mas lento, si llega a 0 entonces perdiste el juego
*/

class Atributo inherits Visual{

    var tipo 
    var property nivelAtributo = 100

    method aumentar(cantidad){

        nivelAtributo = 100.min(nivelAtributo + cantidad)
        // tipo.evaluarNivel(nivelAtributo)
    }


    method disminuir(cantidad){

        nivelAtributo = 0.max(nivelAtributo - cantidad)
        //tipo.evaluarNivel(nivelAtributo)
    }
}

object fisico{
/*  
    method evaluarNivel(cantidad){
        
    }
*/
}

object mental{
/*
    method evaluarNivel(cantidad){

        if(cantidad < 10)
            config.configurarTeclasLoco3()
        else if(cantidad < 40)
            config.configurarTeclasLoco2()
        else if(cantidad < 70)
            config.configurarTeclasLoco1()
        else
            config.configurarTeclas()
    }

*/
}

object neutro{

    //method evaluarNivel(nivelAtributo){}
}

const  energia = new Atributo(position = game.at(2,19), image = "Energia_editado.png", tipo = fisico)
const  hambre = new Atributo(position = game.at(4,19), image = "Hambre_editado.png", tipo = fisico)
const  cordura = new Atributo(position = game.at(6,19), image = "Cordura.png", tipo = mental)
const  higiene = new Atributo(position = game.at(8,19), image = "Higiene_editado.png", tipo = fisico)
const  estudio = new Atributo(nivelAtributo = 0, position = game.at(10, 19), image = "Estudio_editado.png", tipo = neutro)
const  ganasDeIrAlBanio = new Atributo(position = game.at(12, 19), image = "Ganas_de_ir_al_banio_editado.png", tipo = fisico)


