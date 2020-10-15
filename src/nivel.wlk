import wollok.game.*
import estudiante.*
import extras.*
import infraestructura.*

object config {

	method configurarTeclas(){

		keyboard.up().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.down().onPressDo({ estudiante.mover(estudiante.position().down(1),abajo) })
 		keyboard.left().onPressDo({ estudiante.mover(estudiante.position().left(1),izquierda) })
  		keyboard.right().onPressDo({ estudiante.mover(estudiante.position().right(1),derecha) })
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
	}

	method configurarTeclasLoco1(){

		keyboard.down().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.up().onPressDo({ estudiante.mover(estudiante.position().down(1),abajo) })
 		keyboard.left().onPressDo({ estudiante.mover(estudiante.position().left(1),izquierda) })
  		keyboard.right().onPressDo({ estudiante.mover(estudiante.position().right(1),derecha) })
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
	}

	method configurarTeclasLoco2(){

		keyboard.up().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.down().onPressDo({ estudiante.mover(estudiante.position().down(1),abajo) })
 		keyboard.right().onPressDo({ estudiante.mover(estudiante.position().left(1),izquierda) })
  		keyboard.left().onPressDo({ estudiante.mover(estudiante.position().right(1),derecha) })
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
	}
	
	method configurarTeclasLoco3(){

		keyboard.down().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.up().onPressDo({ estudiante.mover(estudiante.position().down(1),abajo) })
 		keyboard.right().onPressDo({ estudiante.mover(estudiante.position().left(1),izquierda) })
  		keyboard.left().onPressDo({ estudiante.mover(estudiante.position().right(1),derecha) })
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
	}

	method configurarTeclasCansado(){

		keyboard.up().onPressDo({game.schedule(1000, {}) estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.down().onPressDo({game.schedule(1000, {}) estudiante.mover(estudiante.position().down(1),abajo)})
 		keyboard.left().onPressDo({game.schedule(1000, {}) estudiante.mover(estudiante.position().left(1),izquierda)})
  		keyboard.right().onPressDo({game.schedule(1000, {}) estudiante.mover(estudiante.position().right(1),derecha)})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
	}
}	

object arriba{

    method posicionEnEsaDireccion() = estudiante.position().up(1)
}

object abajo{

    method posicionEnEsaDireccion() = estudiante.position().down(1)
}

object izquierda{

    method posicionEnEsaDireccion() = estudiante.position().left(1)
}

object derecha{

    method posicionEnEsaDireccion() = estudiante.position().right(1)
}