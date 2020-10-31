import wollok.game.*
import estudiante.*
import extras.*

class Pared{

    var property position
    
    method image() = "Muro_invisible.png"	 
    method reparar(){}
    method esAtravesable() = false
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


class Puerta{

    const puertaAbierta
    const puertaCerrada = "Inodoro.png"
    const property position
    var property image
    
    method esAtravesable() = true
    method abrir(){
        
        image = puertaAbierta
        game.schedule(1000, {self.cerrar()})
    }
    method cerrar(){image = puertaCerrada}

}

const puertaHabitacionIzquierda = new Puerta(puertaAbierta = "Objeto_puerta_izquierda_abierta.png", image = "Inodoro.png", position = game.at(5,2))
const puertaHabitacionDerecha = new Puerta(puertaAbierta = "Objeto_puerta_derecha_abierta.png", image = "Inodoro.png", position = game.at(6,2))
const puertaSalonIzquierda = new Puerta(puertaAbierta = "Objeto_puerta_izquierda_abierta.png", image = "Inodoro.png", position = game.at(7,2))
const puertaSalonDerecha = new Puerta(puertaAbierta = "Objeto_puerta_derecha_abierta.png", image = "Inodoro.png", position = game.at(8,2))
const puertaDeBanioArriba = new Puerta(puertaAbierta = "Objeto_puerta_banio_abierto.png", image = "Inodoro.png", position = game.at(9,2))
const puertaDeBanioAbajo = new Puerta(puertaAbierta = "Objeto_puerta_banio_abierto.png", image = "Inodoro.png", position = game.at(10,2))