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
        (3 .. 5).forEach({ num => muros.add(new Pared(position = game.at(6, num)))})
        (13 .. 15).forEach({ num => muros.add(new Pared(position = game.at(4, num)))})
        (9 .. 15).forEach({ num => muros.add(new Pared(position = game.at(2, num)))})
        (2 .. 5).forEach({ num => muros.add(new Pared(position = game.at(num, 4)))})
        muros.forEach{muro => game.addVisual(muro)}
    }
}


class Puerta{

    const puertaAsignada
    const property position
    var property image = "Muro_invisible.png"
    const imagenAsignada
    
    method esAtravesable() = true
    method abrir(){
    
        puertaAsignada.image(imagenAsignada)
        game.schedule(1000, {self.cerrar()})
    }
    method cerrar(){
        puertaAsignada.image("Muro_invisible.png")
    }
    
   

}

const puertaHabitacion1 = new Puerta(puertaAsignada = visualPuertaHabitacion , position = game.at(18,6) , imagenAsignada = "PuertaAbiertaIzquierda.png")
const puertaHabitacion2 = new Puerta(puertaAsignada = visualPuertaHabitacion , position = game.at(18,9) , imagenAsignada = "PuertaAbiertaIzquierda.png")
const puertaHabitacion3 = new Puerta(puertaAsignada = visualPuertaHabitacion , position = game.at(17,6) , imagenAsignada = "PuertaAbiertaIzquierda.png")
const puertaHabitacion4 = new Puerta(puertaAsignada = visualPuertaHabitacion , position = game.at(17,9) , imagenAsignada = "PuertaAbiertaIzquierda.png")

const puertaSalon1 = new Puerta(puertaAsignada = visualPuertaSalon , position = game.at(26,6) , imagenAsignada = "PuertaAbiertaDerecha.png")
const puertaSalon2 = new Puerta(puertaAsignada = visualPuertaSalon , position = game.at(25,6) , imagenAsignada = "PuertaAbiertaDerecha.png")
const puertaSalon3 = new Puerta(puertaAsignada = visualPuertaSalon , position = game.at(26,9) , imagenAsignada = "PuertaAbiertaDerecha.png")
const puertaSalon4 = new Puerta(puertaAsignada = visualPuertaSalon , position = game.at(25,9) , imagenAsignada = "PuertaAbiertaDerecha.png")

const puertaBanio1 = new Puerta(puertaAsignada = visualPuertaBanio , position = game.at(5,2) , imagenAsignada = "PuertaAbiertaBanio.png")
const puertaBanio2 = new Puerta(puertaAsignada = visualPuertaBanio , position = game.at(6,2) , imagenAsignada = "PuertaAbiertaBanio.png")