import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante{
	var property image = "PinteraccionDer.png"
	var property estado = estado0
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

	/*method evaluarEstado(){

		if(mental.esNivel0() and fisico.esNivel0()){
			estado = estado0
		}
		else if(mental.esNivel0() and fisico.esNivel1()){
			estado = estado1
		}
		else if(mental.esNivel1() and fisico.esNivel0()){
			estado = estado2
		}
		else if(mental.esNivel1() and fisico.esNivel1()){
			estado = estado3
		}
		else if(mental.esNivel2() and fisico.esNivel0()){
			estado = estado4
		}
		else if (mental.esNivel2() and fisico.esNivel1()){
			estado = estado5
		}
	}
*/
	method modificarComportamiento(){

		estado.aplicarEfecto()
	}
}

object estado0{

	method aplicarEfecto(){config.configuracionEstado0()}
}
object estado1{

	method aplicarEfecto(){config.configuracionEstado1()}
}
object estado2{

	method aplicarEfecto(){config.configuracionEstado2()}
}
object estado3{

	method aplicarEfecto(){config.configuracionEstado3()}
}
object estado4{

	method aplicarEfecto(){config.configuracionEstado4()}
}
object estado5{
	
	method aplicarEfecto(){config.configuracionEstado5()}
}