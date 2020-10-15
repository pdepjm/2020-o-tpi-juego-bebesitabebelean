import wollok.game.*
import estudiante.*
import extras.*

class Pared{
	
    const property position
    
    method image() = "Muro_invisible.png" 
	
    method esAtravesable() = false 
    
    method reparar(){}
}



object muro{
  
    const muros = []
	
    method generarMuros(){
        
        (6 .. 15).forEach({ num => muros.add(new Pared(position = game.at(9, num)))}) // lado superior
        (9 .. 16).forEach({ num => muros.add(new Pared(position = game.at(num, 6)))}) // lado inferior
        (10 .. 16).forEach({ num => muros.add(new Pared(position = game.at(num, 8)))}) // lado derecho
        muros.add(new Pared(position = game.at(16, 7))) // lado izquierdo
        (19 .. 23).forEach({ num => muros.add(new Pared(position = game.at(num, 8)))})
        (19 .. 23).forEach({ num => muros.add(new Pared(position = game.at(num, 6)))})
        muros.add(new Pared(position = game.at(19, 7)))
        muros.add(new Pared(position = game.at(23, 7)))
        (9 .. 15).forEach({ num => muros.add(new Pared(position = game.at(19, num)))})
        (26 .. 27).forEach({ num => muros.add(new Pared(position = game.at(num, 6)))})
        (26 .. 27).forEach({ num => muros.add(new Pared(position = game.at(num, 8)))})
        muros.add(new Pared(position = game.at(26, 7)))
        (1 .. 16).forEach({ num => muros.add(new Pared(position = game.at(1, num)))})
        (2 .. 27).forEach({ num => muros.add(new Pared(position = game.at(num, 1)))})
        (2 .. 27).forEach({ num => muros.add(new Pared(position = game.at(num, 16)))})
        (1 .. 16).forEach({ num => muros.add(new Pared(position = game.at(28, num)))})
        (1 .. 6).forEach({ num => muros.add(new Pared(position = game.at(num, 6)))})
        (4 .. 5).forEach({ num => muros.add(new Pared(position = game.at(6, num)))})
        (13 .. 15).forEach({ num => muros.add(new Pared(position = game.at(4, num)))})
        (9 .. 15).forEach({ num => muros.add(new Pared(position = game.at(2, num)))})
        (2 .. 5).forEach({ num => muros.add(new Pared(position = game.at(num, 4)))})
        muros.forEach{muro => game.addVisual(muro)}
    }
}






