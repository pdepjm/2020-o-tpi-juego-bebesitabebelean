import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante {
	
	var property position = game.center()

	//method image() = "estudiante.png"
	

	/*method irA(nuevaPosicion){

		position = nuevaPosicion
	}*/
	
	

	method estaLoco() = cordura.nivel() < 10
	
	method estaHambriento() = hambre.nivel() < 10

	method estaSucio() = higiene.nivel() < 10
	
	method mover(nuevaPosicion, unaOrientacion ){

    	if(self.puedeMoverAl( unaOrientacion)) position = nuevaPosicion
  }
	
	method puedeMoverAl( unaOrientacion ){

  		return game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
}

	/*method mostrarAtributos() = 
								"energia = " + energia.nivel().toString() + "\n" 
							  + "estudio =" + estudio.nivel().toString() + "\n"
							  + "hambre =" + hambre.nivel().toString() + "\n"
							  + "higiene =" + higiene.nivel().toString() + "\n"
							  + "cordura =" + cordura.nivel().toString() + "\n"  */


	
}

