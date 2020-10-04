import wollok.game.*
import nivel.*
import extras.*
import atributos.*

object estudiante {
	const energia = new Atributo(nivel = 100) // cero se desmaya
	const estudio = new Atributo (nivel = 0)
	const hambre = new Atributo(nivel = 100) // cero muere de hambre
	const higiene = new Atributo(nivel = 100) // no lo dejan entrar despues 
	const cordura = new Atributo(nivel = 100) // se vuelve loco

	var property position = game.origin()

	method image() = "estudiante.png"
	

	method irA(nuevaPosicion){

		position = nuevaPosicion
	}
	method usar(objeto){
		objeto.teUsa(self)
	}

	method dormir(){
		energia.aumentar(10)
	}

	method comer(){
		hambre.aumentar(10)
	}
	method estudiar(){
		estudio.aumentar(1)
	}

	method baniarse(){
		higiene.aumentar(100)
	}
	
	method jugar(){
		cordura.aumentar(10)
	}
	
	method estaLoco() = cordura.nivel() < 10
	
	method estaHambriento() = hambre.nivel() < 10

	method estaSucio() = higiene.nivel() < 10

	method mostrarAtributos() = "energia = " + energia.nivel().toString()

	
}

	
