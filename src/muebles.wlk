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
        
        atributoParaDisminuir.forEach({atributo => atributo.disminuir(potenciaParaDisminuir)})
        self.producirEfecto()
    }

    method reparar(){

        energia.disminuir(5)
        higiene.disminuir(5)
        cordura.aumentar(10)

        self.efectoReparacion()
    }

    override method esAtravesable() = true

    method producirEfecto(){}

    method efectoReparacion(){}
}

class MuebleElectrico inherits Mueble{

	var property estado = util
	 
    method quemar(){estado = quemado}
	
    override method efectoReparacion(){

        util.efectoReparacion(self)
    }

  	override method producirEfecto(){
          
        atributoParaAumentar.aumentar(potenciaParaAumentar)
        estado.puedeQuemarse(self)			
    }
}

object util{
    
    method efectoReparacion(muebleElectrico){}

    method puedeQuemarse(muebleElectrico){

        if(self.verificarCondiciones())
		    muebleElectrico.quemar() //o muebleElectrico.estado(util)
	}

    method verificarCondiciones() = 1.randomUpTo(100) <= 10 and termica.estaPrendida()
}

object quemado{
    
    method efectoReparacion(muebleElectrico){
        
        if(not termica.estaPrendida())
            muebleElectrico.estado(util)
    }

    method puedeQuemarse(muebleElectrico){}
}

class MuebleDeMadera inherits Mueble{

	var property desgaste = 100

	override method producirEfecto(){ 
        
		if(self.estaDesgastado())
	        atributoParaAumentar.aumentar(potenciaParaAumentar/2)
        else
            atributoParaAumentar.aumentar(potenciaParaAumentar)

    	desgaste = 0.max(desgaste - 5) 
    }

	override method efectoReparacion(){

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
                                
