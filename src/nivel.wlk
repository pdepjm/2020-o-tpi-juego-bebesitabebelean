import wollok.game.*
import estudiante.*
import extras.*
import infraestructura.*
import muebles.*
import atributos.*
import atributos.*
import config.*


//TODO: Este objeto necesita una refactoreada violenta, como hablamos antes idealmente desaparece esta combinatoria y los atributos conocen y modifican la configuracion del juego que quieren
// Si no son los atributos es alguien mas que conoce las reglas :) 
// Otra cosa, no entendi tooodas las consecuencias asi que hice las combinaciones, es para mostrar como podriamos usar el objeto config, pero NO tiene que quedar asi.

object config {

	method configuracionEstado0(){ // mental0 y fisico0
		// Estado inicial
		configuracion.resetear()
		configuracion.impactar()
	}

	method configuracionEstado1(){  // mental0 y fisico1
		// Solo va mas lento
		configuracion.agregarLag()
		configuracion.caminaNormal()
		configuracion.impactar()
	}

	method configuracionEstado2(){ // mental1 y fisico0
		// Invierte teclase
		configuracion.sinLag()
		configuracion.invertir()
		configuracion.impactar()
	}
	
	method configuracionEstado3(){ // mental1 y fisico1
		// Lento e invertido
		configuracion.agregarLag()
		configuracion.invertir()
		configuracion.impactar()
	}

	method configuracionEstado4(){ // mental2 y fisico0
		// sin lag pero camina invertido
		configuracion.sinLag()
		configuracion.invertir()
		configuracion.impactar()
	}

	method configuracionEstado5(){ // mental2 y fisico1
		// Lento e invertido
		configuracion.agregarLag()
		configuracion.invertir()
		configuracion.impactar()
	}
	
}

object nivel {
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