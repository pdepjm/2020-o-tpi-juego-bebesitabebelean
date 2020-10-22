import wollok.game.*
import extras.*
import nivel.*

class Atributo inherits Visual{

    var tipoAtributo 
    var property nivelAtributo = 100

    method aumentar(cantidad){

        nivelAtributo = 100.min(nivelAtributo + cantidad)
        tipoAtributo.aumentarPotenciaEn(cantidad/2)
    }


    method disminuir(cantidad){

        nivelAtributo = 0.max(nivelAtributo - cantidad)
        tipoAtributo.disminuirPotenciaEn(cantidad/2)
    }
}


class TipoAtributo inherits Visual{
    
    var property potencia = 100
    
    method aumentarPotenciaEn(cantidad){
        
        potencia = 100.min(potencia + cantidad)
    }

    method disminuirPotenciaEn(cantidad){
        
        potencia = 0.max(potencia - cantidad)
    }
}

class TipoFisico inherits TipoAtributo{
    
    method esNivel0() = potencia <= 100 and potencia >= 50
    method esNivel1() = not self.esNivel0()
    method afectarMovimiento(){
    	
    	if(potencia < 50)
    		config.configuracionEstado1()
    	else config.configuracionEstado0()
    }
}

class TipoMental inherits TipoAtributo{
    
    method esNivel0() = potencia <= 100 and potencia >= 70
    method esNivel1() = potencia <= 70 and potencia >= 40
    method esNivel2() = not (self.esNivel0() or self.esNivel1())
}


const fisico = new TipoFisico(position = game.at(14,19), image = "pepito.png")
const mental = new TipoMental(position = game.at(16,19), image = "pepito2.png")
const neutro = new TipoAtributo(position = game.at(-1,-1), image = "pepito3.png")


const  energia = new Atributo(position = game.at(2,19), image = "Energia_editado.png", tipoAtributo = fisico)
const  hambre = new Atributo(position = game.at(4,19), image = "Hambre_editado.png", tipoAtributo = fisico)
const  cordura = new Atributo(position = game.at(6,19), image = "Cordura.png", tipoAtributo = mental)
const  higiene = new Atributo(position = game.at(8,19), image = "Higiene_editado.png", tipoAtributo = fisico)
const  estudio = new Atributo(nivelAtributo = 0, position = game.at(10, 19), image = "Estudio_editado.png", tipoAtributo = neutro)
const  ganasDeIrAlBanio = new Atributo(position = game.at(12, 19), image = "Ganas_de_ir_al_banio_editado.png", tipoAtributo = fisico)