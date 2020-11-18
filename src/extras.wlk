import wollok.game.*
import estudiante.*
import nivel.*
import atributos.*

class Visual{
    
    var property position
    var property image
    method esAtravesable() = false
    method abrir(){}
}

class VisualPuerta inherits Visual{
    
    override method esAtravesable() = true
}

object musica{
    
    var temaFondo = game.sound("la-bebesita-bebe-lean-8-bit-cover.mp3")
    
    method reproducirMusicaFondo(){
        
        game.schedule(500, {temaFondo.shouldLoop(true)
                            temaFondo.volume(0.05) 
                            temaFondo.play()
                            })
    }
}

object menu inherits Visual{
    
    method desaparecer() {image = "Muro_invisible.png"} 
}

object final inherits Visual{

    method aparecer(){

        game.addVisual(self)
    }
    
    method electrico(){
        
        image = "FinalElectrico.png"
        self.terminarJuego()
    }
    
    method promocion(){
        
        if(estudio.maximo()){
            image = "FinalPromocion.png"
            self.terminarJuego()
        }
    }
    
    method terminarJuego(){
        
        game.clear()
        self.aparecer()
        game.schedule(5000,{game.stop()})
    }
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