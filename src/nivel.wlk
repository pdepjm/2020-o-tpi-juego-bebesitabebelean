import wollok.game.*
import estudiante.*
import extras.*
import infraestructura.*
import muebles.*
import atributos.*

object config {

	var tieneLag = false
	var direccion = direccionNormal

	method agregarLag(){
		
		tieneLag = true
		self.impactar()
	}

	method sinLag(){
		
		tieneLag = false
		self.impactar()
	}

	method invertirTotalmente(){

		direccion = direccionTotalmeteInvertida
		self.impactar()
	}

	method semiInvertir(){

		direccion = direccionSemiInvertida
		self.impactar()
	}

	method caminaNormal(){
		direccion = direccionNormal
		self.impactar()
	}

	method resetear(){
		
		tieneLag = false
		direccion = direccionNormal
		self.impactar()
	}

	method impactar(){
		
		const movimientoW = {estudiante.mover(direccion.moverArriba(), direccion.arriba())}
		const movimientoS = {estudiante.mover(direccion.moverAbajo(), direccion.abajo())}
		const movimientoA = {estudiante.mover(direccion.moverIzquierda(), direccion.izquierda())}
		const movimientoD = {estudiante.mover(direccion.moverDerecha(), direccion.derecha())}

		game.clear()
		if(tieneLag){

			keyboard.s().onPressDo({game.schedule(1000, movimientoS)})
  			keyboard.w().onPressDo({game.schedule(1000, movimientoW)})
 			keyboard.a().onPressDo({game.schedule(1000, movimientoA)})
  			keyboard.d().onPressDo({game.schedule(1000, movimientoD)})
		}
		else{

			keyboard.s().onPressDo(movimientoS)
  			keyboard.w().onPressDo(movimientoW)
 			keyboard.a().onPressDo(movimientoA)
  			keyboard.d().onPressDo(movimientoD)
		}

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


object direccionNormal {
	
	method arriba() = arriba
	method moverArriba() = estudiante.position().up(1)
	method abajo() = abajo
	method moverAbajo() = estudiante.position().down(1) 
	method izquierda() = izquierda
	method moverIzquierda() = estudiante.position().left(1) 
	method derecha() = derecha
	method moverDerecha() = estudiante.position().right(1) 
}

object direccionSemiInvertida {

	method arriba() = arriba
	method moverArriba() = estudiante.position().up(1) 
	method abajo() = abajo
	method moverAbajo() = estudiante.position().down(1) 
	method izquierda() = derecha
	method moverIzquierda() = estudiante.position().right(1) 
	method derecha() = izquierda
	method moverDerecha() = estudiante.position().left(1) 
}

object direccionTotalmeteInvertida {
	
	method arriba() = abajo
	method moverArriba() = estudiante.position().down(1) 
	method abajo() = arriba
	method moverAbajo() = estudiante.position().up(1) 
	method izquierda() = derecha
	method moverIzquierda() = estudiante.position().right(1) 
	method derecha() = izquierda
	method moverDerecha() = estudiante.position().left(1) 
}	

object arriba{
	method imagenDelJugador() = "PInteraccionArriba.png"
    method posicionEnEsaDireccion() = estudiante.position().up(1)
}

object abajo{
	method imagenDelJugador() = "PInteraccionAbajo.png"
    method posicionEnEsaDireccion() = estudiante.position().down(1)
}

object izquierda{
	method imagenDelJugador() = "PuntoInteraccion2.png"
    method posicionEnEsaDireccion() = estudiante.position().left(1)
}

object derecha{
	method imagenDelJugador() = "PInteraccionDer.png"
    method posicionEnEsaDireccion() = estudiante.position().right(1)
}