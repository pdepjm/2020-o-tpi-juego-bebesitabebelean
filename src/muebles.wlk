import wollok.game.*
import estudiante.*
import nivel.*
import atributos.*
import infraestructura.*
import extras.*

class Mueble inherits Visual{

    const atributoParaAumentar
    const atributoParaDisminuir
    const potenciaParaAumentar
    const potenciaParaDisminuir

    method usar(){
        
        atributoParaAumentar.aumentar(potenciaParaAumentar)
        atributoParaDisminuir.forEach({atributo => atributo.disminuir(potenciaParaDisminuir)})
        estudiante.evaluarEstado()
        estudiante.modificarComportamiento()
    }

    method reparar(){

        energia.disminuir(5)
        higiene.disminuir(5)
        cordura.aumentar(10)
    }

    override method esAtravesable() = true

}


/*
Los muebles pueden ser 
 - usados
 - arreglados

Hay dos variedades de muebles: eléctricos o de madera
- los muebles eléctricos 
            - Cuando los usas: si no tienen luz no funcionan, hay un 10% de chances que se quemen(cuando se queman tampoco hacen nada por vos)
            - Solamente se pueden arreglar cuando están quemados
            - Cuando los arreglas dejan de estar quemados
- los muebles de madera:
             - Tienen un nivel de desgaste que va de 0 a 100 (no puede tener mas que de 0 a 100)
            - cada vez que lo usas se desgastan en 5, ayudan a la persona dependiendo de su nivel de desgaste (esto no lo hablamos, pero fíjense 
            el detalle de como afecta al efecto si es un multiplicador o como lo quieren modelar). Dijimos que cuando se desgastan del todo te dan la mitad.
            - se pueden arreglar si estan algo desgastados
            - cuando los arreglas les reparas 20 de desgaste
- Todos los muebles cuando los arreglan, quien lo haya arreglado mejora su vivienda (esto significa que pierde energía y se ensucia pero aumenta 
su cordura)

(aca nos faltó pensar otro tipo de "mueble" que englobe a la ducha por ejemplo, pero lo podemos hacer bien básico y decir que la ducha es un 
mueble Básico que cuando las usas mejoran en 10 un atributo  y no se desgasta, por lo cual nunca se pueden arreglar)

*/

class MuebleElectrico inherits Mueble{

	var property estaQuemado = false
	
	method quemar(){estaQuemado = true} 

	override method reparar(){
        
        if(not termica.estaPrendida()){
            super()
            estaQuemado = false
        }
    }

  	override method usar(){
	
	    if(not self.estaQuemado() and termica.estaPrendida()){
            
			super()
	        self.puedeQuemarse()	
		}
		
    }

	method puedeQuemarse(){
	
	    if(1.randomUpTo(100) <= 10)
		    self.quemar()
	}
	
}

class MuebleDeMadera inherits Mueble{

	var property desgaste = 100

	override method usar(){ 
        
		if(self.estaDesgastado())
	        atributoParaAumentar.aumentar(potenciaParaAumentar/2)
        else
            atributoParaAumentar.aumentar(potenciaParaAumentar)

        atributoParaDisminuir.forEach({atributo => atributo.disminuir(potenciaParaDisminuir)})
    	desgaste = 0.max(desgaste - 5) 
        estudiante.evaluarEstado()
        estudiante.modificarComportamiento()
    }

	override method reparar(){

        super()
        desgaste = 100.min(desgaste + 20)
    }

    method estaDesgastado() = desgaste == 0
}


const escritorio = new MuebleDeMadera(  
                                        position = game.at(26,11),                      
                                        image = "PInteraccionDer.png", 
                                        atributoParaAumentar = estudio, 
                                        potenciaParaAumentar = 1,
                                        atributoParaDisminuir = [cordura,energia], 
							            potenciaParaDisminuir = 10
                                 
                                    )

const playStation = new MuebleElectrico(    
                                            position = game.at(20,14),
                                            image = "PInteraccionDer.png", 
                                            atributoParaAumentar = cordura, 
                                            potenciaParaAumentar = 5,
                                            atributoParaDisminuir = [energia], 
							                potenciaParaDisminuir = 10
                                        )

const ducha = new Mueble(   
                            position = game.at(2,2), 
                            image = "PInteraccionArriba.png", 
                            atributoParaAumentar = higiene, 
							potenciaParaAumentar = 100,
                            atributoParaDisminuir = [energia], 
							potenciaParaDisminuir = 10
                        )
							
const trono = new Mueble(   
                            position = game.at(4,2), 
                            image = "PInteraccionArriba.png", 
							atributoParaAumentar = ganasDeIrAlBanio, 
							potenciaParaAumentar = 10, 
							atributoParaDisminuir = [higiene], 
							potenciaParaDisminuir = 100
                        )
							
const cama = new MuebleDeMadera(    
                                    position = game.at(15,14), 
                                    image = "PuntoInteraccion2.png", 
						            atributoParaAumentar = energia, 
							        potenciaParaAumentar = 5 ,
							        atributoParaDisminuir = [hambre], 
							        potenciaParaDisminuir = 10
                             
                                )
							
const horno = new MuebleElectrico(   
                                    position = game.at(3,11),
                                    image = "PuntoInteraccion2.png", 
							        atributoParaAumentar = hambre, 
							        potenciaParaAumentar = 5, 
							        atributoParaDisminuir = [energia, higiene, ganasDeIrAlBanio], 
							        potenciaParaDisminuir = 10
                                )
                                
