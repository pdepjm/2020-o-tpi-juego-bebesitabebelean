import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante {
	var property position = game.center()

	const property energia = new Atributo(nivel = 100, position = game.at(2,19))
	const property hambre = new Atributo(nivel = 100, position = game.at(4,19))
	const property cordura = new Atributo(nivel = 100, position = game.at(6,19))
	const property higiene = new Atributo(nivel = 100, position = game.at(8,19))
	const property estudio = new Atributo(nivel = 0, position = game.at(10, 19))

	//method image() = "estudiante.png"
	

	/*method irA(nuevaPosicion){

		position = nuevaPosicion
	}*/
	method usar(objeto){
		objeto.teUsa(self)
	}

	method potenciar(atributo, potencia){
		
		atributo.aumentar(potencia)
	}

	method estaLoco() = cordura.nivel() < 10
	
	method estaHambriento() = hambre.nivel() < 10

	method estaSucio() = higiene.nivel() < 10
	
	method mover(nuevaPosicion, unaOrientacion ) { 
    if( self.puedeMoverAl( unaOrientacion) ) position = nuevaPosicion
  }
	
	method puedeMoverAl( unaOrientacion ) {
  return game.getObjectsIn( unaOrientacion.posicionEnEsaDireccion() ).all { unObj => unObj.esAtravesable() }
}

	/*method mostrarAtributos() = 
								"energia = " + energia.nivel().toString() + "\n" 
							  + "estudio =" + estudio.nivel().toString() + "\n"
							  + "hambre =" + hambre.nivel().toString() + "\n"
							  + "higiene =" + higiene.nivel().toString() + "\n"
							  + "cordura =" + cordura.nivel().toString() + "\n"  */


	
}

