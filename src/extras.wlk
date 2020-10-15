import wollok.game.*
import estudiante.*
import nivel.*


class Visual{
    
    var property position
    var property image
    method esAtravesable() = false
}

const visualTermica = new Visual(position = game.at(12,7), image = "Termica_Prendida.png")
const visualEscritorio = new Visual(position = game.at(27,11) , image = "escritorio.png")
const visualPlayStation = new Visual(position = game.at(21, 13) , image = "Play.png")
const visualDucha = new Visual(position = game.at(2, 3) , image = "Ducha_sin_agua.png")
const visualTrono = new Visual(position = game.at(4, 3) , image = "Inodoro.png")


object termica{

    var property estaPrendida = true
    const property position = game.at(12,5)
    const property image = "PInteraccionArriba.png" 

    method esAtravesable() = true
    
    method prender(){
        
        estaPrendida = true
         
    }

    method cortar(){

        estaPrendida = false
    }

    method usar(){
        
        estaPrendida = not estaPrendida
        
        if(estaPrendida)
            visualTermica.image("Termica_Prendida.png")
        else
           visualTermica.image("Termica_ApagadaORota.png") 
    }

    method reparar(){}
}