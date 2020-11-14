import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante{
	
	var property image = "PinteraccionDer.png"
	var property position = game.center()
	var orientacion = derecha
	
	method mover(nuevaPosicion, unaOrientacion){
		orientacion = unaOrientacion
		self.actualizarImagen()

    	if(self.puedeMoverAl(unaOrientacion)) {
    		
    		//atributos.forEach({atributo => atributo.afectarMovimiento()})
    		position = nuevaPosicion
    	}
    	
  	}
	
	method puedeMoverAl(unaOrientacion){

  		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}
	
	method actualizarImagen() {
    	
		image = orientacion.imagenDelJugador()
    	game.removeVisual(self)
		game.addVisual(self)
  	}

	method usar(){}

	method reparar(){}
}
