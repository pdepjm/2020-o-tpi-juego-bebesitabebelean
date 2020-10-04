import wollok.game.*
import estudiante.*
import extras.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({if ( estudiante.position().x() != 0) {estudiante.irA(estudiante.position().left(1))}})
		keyboard.right().onPressDo({if (estudiante.position().x() != 29) {estudiante.irA(estudiante.position().right(1))}})
		keyboard.up().onPressDo({if (estudiante.position().y() != 19) {estudiante.irA(estudiante.position().up(1))}})
		keyboard.down().onPressDo({if (estudiante.position().y() != 0) {estudiante.irA(estudiante.position().down(1))}})
		keyboard.e().onPressDo({estudiante.usar(game.uniqueCollider(estudiante))})
		keyboard.c().onPressDo({game.say(estudiante, estudiante.mostrarAtributos())})
	}

	method configurarColisiones() {
		game.onCollideDo(estudiante, { algo => algo.teUsa(estudiante)})
	}

}