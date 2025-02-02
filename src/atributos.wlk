import wollok.game.*
import extras.*
import nivel.*

class Atributo inherits Visual{

    var tipoAtributo 
    var property nivelAtributo = 100

    method aumentar(cantidad){

        nivelAtributo = 100.min(nivelAtributo + cantidad)
        tipoAtributo.aumentarPotenciaEn(cantidad/2)
        final.promocion()
    }


    method disminuir(cantidad){

        nivelAtributo = 0.max(nivelAtributo - cantidad)
        tipoAtributo.disminuirPotenciaEn(cantidad/2)
    }

    method maximo() = nivelAtributo == 100   
}


class TipoAtributo inherits Visual{
    
    var property potencia = 100
    
    method aumentarPotenciaEn(cantidad){
        
        potencia = 100.min(potencia + cantidad)
        self.afectarMovimiento()
    }

    method disminuirPotenciaEn(cantidad){
        
        potencia = 0.max(potencia - cantidad)
        self.afectarMovimiento()
    }

    method afectarMovimiento(){}
}

object fisico inherits TipoAtributo{
    
    override method afectarMovimiento(){
    	
    	if(potencia < 50){
    		config.agregarLag()
            image = "BrazoDebil.png"
        }
    	else{ 
            config.sinLag()
            image = "BrazoFuerte.png"
        }
    }
}

object mental inherits TipoAtributo{
    
    var property nivelMental

    method esNivel0() = potencia <= 100 and potencia >= 70
    method esNivel1() = potencia <= 70 and potencia >= 40

    override method afectarMovimiento(){
        
        if(self.esNivel0()){ 
            config.caminaNormal()
            image = "CerebroToChill.png"
        }
        else if (self.esNivel1()){ 
            config.semiInvertir()
            image = "CerebroLoco.png"
        }
        else{ 
            config.invertirTotalmente()
            image = "CerebroUnts.png"
        }
    }
}




const neutro = new TipoAtributo(position = game.at(-1,-1), image = "pepito3.png")


const  energia = new Atributo(position = game.at(2,19), image = "Energia_editado.png", tipoAtributo = fisico)
const  hambre = new Atributo(position = game.at(4,19), image = "Hambre_editado.png", tipoAtributo = fisico)
const  cordura = new Atributo(position = game.at(6,19), image = "Cordura.png", tipoAtributo = mental)
const  higiene = new Atributo(position = game.at(8,19), image = "Higiene_editado.png", tipoAtributo = fisico)
const  estudio = new Atributo(nivelAtributo = 0, position = game.at(10, 19), image = "Estudio_editado.png", tipoAtributo = neutro)
const  ganasDeIrAlBanio = new Atributo(position = game.at(12, 19), image = "Ganas_de_ir_al_banio_editado.png", tipoAtributo = fisico)