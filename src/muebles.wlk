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
        fisico.afectarMovimiento()
        mental.afectarMovimiento()
    }

    method reparar(){

        energia.disminuir(5)
        higiene.disminuir(5)
        cordura.aumentar(10)
    }

    override method esAtravesable() = true

}

class MuebleElectrico inherits Mueble{

	var property estado = util
	 
    method quemar(){ estado = quemado }
	
    override method reparar(){
        
        if(not termica.estaPrendida()){
            
            super()
            estado = util
        }
    }

  	override method usar(){
	
	    if(estado.estaEnCondiciones()){
            
			super()
	        self.puedeQuemarse()	
		}
		
    }

	method puedeQuemarse(){
	
	    if(1.randomUpTo(100) <= 10)
		    self.quemar()
	}	
}

object util{

    method estaEnCondiciones() = termica.estaPrendida()
}

object quemado{
    
    method estaEnCondiciones() = false
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
       // estudiante.evaluarEstado()
        fisico.afectarMovimiento()
        mental.afectarMovimiento()
    }

	override method reparar(){

        super()
        desgaste = 100.min(desgaste + 20)
    }

    method estaDesgastado() = desgaste < 50
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
                                
