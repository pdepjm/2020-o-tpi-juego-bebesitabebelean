import wollok.game.*
import estudiante.*
import extras.*
import infraestructura.*

object config {

	method configurarTeclas() {
		keyboard.up().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.down().onPressDo({ estudiante.mover(estudiante.position().down(1),abajo) })
 		keyboard.left().onPressDo({ estudiante.mover(estudiante.position().left(1),izquierda) })
  		keyboard.right().onPressDo({ estudiante.mover(estudiante.position().right(1),derecha) })
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		//keyboard.c().onPressDo({game.say(estudiante, estudiante.mostrarAtributos())})
	}

	

}