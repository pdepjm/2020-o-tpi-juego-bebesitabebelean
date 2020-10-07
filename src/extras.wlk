import wollok.game.*
import estudiante.*
import nivel.*

class Mueble{

    const property position
    const property image
    const atributo
    const potencia

    method teUsa(persona){persona.potenciar(atributo, potencia)}

}

const escritorio = new Mueble(position = game.at(25,9), image = "escritorio.png", atributo = estudiante.estudio(), potencia = 1)
const playStation = new Mueble(position = game.at(20,14), image = "playStation.png", atributo = estudiante.cordura(), potencia = 5)
const ducha = new Mueble(position = game.at(4,2), image = "Ducha sin agua.png", atributo = estudiante.higiene(), potencia = 100)
const trono = new Mueble(position = game.at(2,2), image = "Inodoro.png", atributo = estudiante.higiene(), potencia = -10)
const cama = new Mueble(position = game.at(15,14), image = "cama.png", atributo = estudiante.energia(), potencia = 5)
const horno = new Mueble(position = game.at(2,11), image = "horno.png", atributo = estudiante.hambre(), potencia = 5)


