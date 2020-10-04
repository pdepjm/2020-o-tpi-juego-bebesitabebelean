import wollok.game.*
import estudiante.*
import nivel.*

object escritorio{  // donde estudia
    method position() = game.at(27,8)
    method teUsa(persona){persona.estudiar()}    
    //method image() = "escritorio.png"
}

object playStation{
    method position() = game.at(16,24)
    method teUsa(persona){persona.jugar()}
    //method image() = "playStation.png"
}

object banio{
    method position() = game.at(2,2)
    method teUsa(persona){persona.baniarse()}
    //method image() = "banio.png"
}

object cama{
    method position() = game.at(15,14)
    method teUsa(persona){persona.dormir()}
    //method image() = "cama.png"
}

object horno{
    method position() = game.at(2,11)
    method teUsa(persona){persona.comer()} 
}
