import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante{
	
	var estado = estado0
	var property position = game.center()
	
	method mover(nuevaPosicion, unaOrientacion ){

    	if(self.puedeMoverAl(unaOrientacion)) position = nuevaPosicion
  	}
	
	method puedeMoverAl( unaOrientacion ){

  		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}

	method evaluarEstado(){

		if(mental.nivelTipoAtributo() == nivelMental0 and fisico.nivelTipoAtributo() == nivelFisico0){
			estado = estado0
		}
		else if(mental.nivelTipoAtributo() == nivelMental0 and fisico.nivelTipoAtributo() == nivelFisico1){
			estado = estado1
		}
		else if(mental.nivelTipoAtributo() == nivelMental1 and fisico.nivelTipoAtributo() == nivelFisico0){
			estado = estado2
		}
		else if(mental.nivelTipoAtributo() == nivelMental1 and fisico.nivelTipoAtributo() == nivelFisico1){
			estado = estado3
		}
		else if(mental.nivelTipoAtributo() == nivelMental2 and fisico.nivelTipoAtributo() == nivelFisico0){
			estado = estado4
		}
		else if (mental.nivelTipoAtributo() == nivelMental2 and fisico.nivelTipoAtributo() == nivelFisico1){
			estado = estado5
		}
		
	}

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