import wollok.game.*
import estudiante.*
import extras.*
import infraestructura.*
import muebles.*
import atributos.*

object config {

	method configuracionEstado0(){ // mental0 y fisico0

		game.clear()
		keyboard.w().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.s().onPressDo({estudiante.mover(estudiante.position().down(1),abajo)})
 		keyboard.a().onPressDo({estudiante.mover(estudiante.position().left(1),izquierda)})
  		keyboard.d().onPressDo({estudiante.mover(estudiante.position().right(1),derecha)})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}

	method configuracionEstado1(){  // mental0 y fisico1
		
		game.clear()
		keyboard.w().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().up(1),arriba)})})
  		keyboard.s().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().down(1),abajo)})})
 		keyboard.a().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().left(1),izquierda)})})
  		keyboard.d().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().right(1),derecha)})})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}

	method configuracionEstado2(){ // mental1 y fisico0

		game.clear()
		keyboard.s().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.w().onPressDo({estudiante.mover(estudiante.position().down(1),abajo)})
 		keyboard.a().onPressDo({estudiante.mover(estudiante.position().left(1),izquierda)})
  		keyboard.d().onPressDo({estudiante.mover(estudiante.position().right(1),derecha)})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}
	
	method configuracionEstado3(){ // mental1 y fisico1
		game.clear()
		keyboard.s().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().up(1),arriba)})})
  		keyboard.w().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().down(1),abajo)})})
 		keyboard.a().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().left(1),izquierda)})})
  		keyboard.d().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().right(1),derecha)})})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}

	method configuracionEstado4(){ // mental2 y fisico0

		game.clear()
		keyboard.s().onPressDo({estudiante.mover(estudiante.position().up(1),arriba)})
  		keyboard.w().onPressDo({estudiante.mover(estudiante.position().down(1),abajo)})
 		keyboard.d().onPressDo({estudiante.mover(estudiante.position().left(1),izquierda)})
  		keyboard.a().onPressDo({estudiante.mover(estudiante.position().right(1),derecha)})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}

	method configuracionEstado5(){ // mental2 y fisico1
		
		game.clear()
		keyboard.s().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().up(1),arriba)})})
  		keyboard.w().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().down(1),abajo)})})
 		keyboard.d().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().left(1),izquierda)})})
  		keyboard.a().onPressDo({game.schedule(1000, {estudiante.mover(estudiante.position().right(1),derecha)})})
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		self.configurarVisuales()
	}

	method configurarVisuales(){

		game.addVisual(escritorio)
		game.addVisual(horno)
		game.addVisual(trono)
		game.addVisual(cama)
		game.addVisual(playStation)
		game.addVisual(ducha)
		game.addVisual(energia)
		game.addVisual(hambre)
		game.addVisual(cordura)
		game.addVisual(estudio)
		game.addVisual(higiene)
		game.addVisual(ganasDeIrAlBanio)
		game.addVisual(termica)
		game.addVisual(visualTermica)
		game.addVisual(visualEscritorio)
		game.addVisual(visualPlayStation)
		game.addVisual(visualDucha)
		game.addVisual(visualTrono)
		game.addVisual(estudiante)
		game.addVisual(fisico)
		game.addVisual(mental)
		game.showAttributes(estudiante)
		game.showAttributes(energia)
		game.showAttributes(hambre)
		game.showAttributes(cordura)
		game.showAttributes(estudio)
		game.showAttributes(higiene)
		game.showAttributes(ganasDeIrAlBanio)
		game.showAttributes(fisico)
		game.showAttributes(mental)
		muro.generarMuros()
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