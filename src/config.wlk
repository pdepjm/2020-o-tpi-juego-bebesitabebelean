import wollok.game.*
import infraestructura.*
import estudiante.*
import nivel.*

object configuracion {
	var tieneLag = false
	var direccion = direccionNormal
	
	method agregarLag(){
		tieneLag = true
	}
	
	method sinLag(){
		tieneLag = false
	}
	
	method invertir(){
		direccion = direccion.invertida()
	}
	
	method caminaNormal(){
		direccion = direccionNormal
	}
	
	method resetear(){
		tieneLag = false
		direccion = direccionNormal
	}
	
	method impactar(){
		const movimientoW = {estudiante.mover(direccion.moverArriba(),direccion.arriba())}
		const movimientoS = {estudiante.mover(direccion.moverAbajo(),direccion.abajo())}
		const movimientoA = {estudiante.mover(direccion.moverIzquierda(),direccion.izquierda())}
		const movimientoD = {estudiante.mover(direccion.moverDerecha(),direccion.derecha())}
		
		game.clear()
		if(tieneLag){
			keyboard.s().onPressDo({game.schedule(1000, movimientoS)})
  			keyboard.w().onPressDo({game.schedule(1000, movimientoW)})
 			keyboard.a().onPressDo({game.schedule(1000,movimientoA)})
  			keyboard.d().onPressDo({game.schedule(1000,movimientoD)})
		}else{
			keyboard.s().onPressDo(movimientoS)
  			keyboard.w().onPressDo(movimientoW)
 			keyboard.a().onPressDo(movimientoA)
  			keyboard.d().onPressDo(movimientoD)
		}
		
		keyboard.e().onPressDo({game.uniqueCollider(estudiante).usar()})
		keyboard.r().onPressDo({game.uniqueCollider(estudiante).reparar()})
		nivel.configurarVisuales()
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
	method invertida() = direccionTotalmeteInvertida
}

object direccionTotalmeteInvertida {
	method arriba() = abajo
	method moverArriba() = estudiante.position().up(1) 
	method abajo() = arriba
	method moverAbajo() = estudiante.position().down(1) 
	method izquierda() = derecha
	method moverIzquierda() = estudiante.position().right(1) 
	method derecha() = izquierda
	method moverDerecha() = estudiante.position().left(1) 
	method invertida() = self
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