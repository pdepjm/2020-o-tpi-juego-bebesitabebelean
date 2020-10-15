import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante{
	
	var property position = game.center()

	method estaLoco() = cordura.nivel() < 10
	
	method estaHambriento() = hambre.nivel() < 10

	method estaSucio() = higiene.nivel() < 10
	
	method mover(nuevaPosicion, unaOrientacion ){

    	if(self.puedeMoverAl(unaOrientacion)) position = nuevaPosicion
  	}
	
	method puedeMoverAl( unaOrientacion ){

  		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}
}

