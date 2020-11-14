import wollok.game.*
import estudiante.*
import nivel.*


class Visual{
    
    var property position
    var property image
    method esAtravesable() = false
    method abrir(){}
}

class VisualPuerta inherits Visual{
    
    override method esAtravesable() = true
}



const visualTermica = new Visual(position = game.at(12,7), image = "Termica_Prendida.png")
const visualEscritorio = new Visual(position = game.at(27,11) , image = "escritorio.png")
const visualPlayStation = new Visual(position = game.at(21, 13) , image = "Play.png")
const visualDucha = new Visual(position = game.at(2, 3) , image = "Ducha_sin_agua.png")
const visualTrono = new Visual(position = game.at(4, 3) , image = "Inodoro.png")
const visualPuertaHabitacion = new VisualPuerta(position = game.at(17,5) , image = "Muro_invisible.png")
const visualPuertaSalon = new VisualPuerta(position = game.at(24,5) , image = "Muro_invisible.png")
const visualPuertaBanio = new VisualPuerta(position = game.at(5,2) , image = "Muro_invisible.png")



object termica{

    var property estado = prendida
    const property position = game.at(12,5)
    const property image = "PInteraccionArriba.png" 
    
    method abrir(){}

    method esAtravesable() = true

    method estaPrendida() = estado == prendida

    method usar(){
    
        estado.efectoUso()
    }

    method reparar(){}
}

object prendida{
    
    method efectoUso(){
        
        termica.estado(apagada)
        visualTermica.image("Termica_ApagadaORota.png")
    }
}


object apagada{
    
    method efectoUso(){
        
        termica.estado(prendida)
        visualTermica.image("Termica_Prendida.png")
    }
  
}