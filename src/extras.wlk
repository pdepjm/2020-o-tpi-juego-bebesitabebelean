import wollok.game.*
import estudiante.*
import nivel.*

class Mueble{

    const property position
    const property image
    const atributo
    const potencia

    method teUsa(persona){persona.potenciar(atributo, potencia)}
    method esAtravesable() = true

}

const escritorio = new Mueble(position = game.at(25,9), image = "escritorio.png", atributo = estudiante.estudio(), potencia = 1)
const playStation = new Mueble(position = game.at(20,14), image = "playStation.png", atributo = estudiante.cordura(), potencia = 5)
const ducha = new Mueble(position = game.at(4,2), image = "Ducha sin agua.png", atributo = estudiante.higiene(), potencia = 100)
const trono = new Mueble(position = game.at(2,2), image = "Inodoro.png", atributo = estudiante.higiene(), potencia = -10)
const cama = new Mueble(position = game.at(15,14), image = "cama.png", atributo = estudiante.energia(), potencia = 5)
const horno = new Mueble(position = game.at(2,11), image = "horno.png", atributo = estudiante.hambre(), potencia = 5)


class Pared{
	
	const property position
	method esAtravesable() = false
	
}

const muro1 = new Pared(position= game.at(9,17))
const muro2 = new Pared(position= game.at(9,16))
const muro3 = new Pared(position= game.at(9,15))
const muro4 = new Pared(position= game.at(9,14))
const muro5 = new Pared(position= game.at(9,13))
const muro6 = new Pared(position= game.at(9,12))
const muro7 = new Pared(position= game.at(9,11))
const muro8 = new Pared(position= game.at(9,10))
const muro9 = new Pared(position= game.at(9,9))
const muro10 = new Pared(position= game.at(9,8))
const muro11= new Pared(position= game.at(9,7))

object muro{
	const muros=[muro1,muro2,muro3,muro4, muro5, muro6, muro7, muro8, muro9]
	method generarMuros(){muros.forEach{muro => game.addVisual(muro)}}
}


object arriba {
  method posicionEnEsaDireccion() = estudiante.position().up(1)
}

object abajo {
  method posicionEnEsaDireccion() = estudiante.position().down(1)
}

object izquierda {
  method posicionEnEsaDireccion() = estudiante.position().left(1)
}

object derecha {
  method posicionEnEsaDireccion() = estudiante.position().right(1)
}
