/*
1- Polimorfismo: ¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?
2- Colecciones: Indicar alguna colección que aparezca en el código. ¿Qué operaciones de colecciones se utilizan? ¿Cómo se relaciona con la declaratividad del código?
3- Clases: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?
4- Herencia: ¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?
5- Composición: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Por qué no herencia?

1- El mensaje polimorfico es el moverArriba(), moverAbajo(), etc, los objetos que lo implementan son direccionNormal, 
direccionSemiInvertida y direccionTotalmenteInvertida. El objeto que se aprovecha de esto es config, que hace direccion.moverArriba(), direccion.moverAbajo(), etc y no
le importa como lo hace cada tipo de direccion. La ventaja está en que se pueden agregar más direcciones sin modificar el codigo, solo habria que agregar un objeto o clase
que implemente los metodos antes mencionados.

2- La coleccion que aparece en el codigo es en el atributosParaDisminuir de cada mueble. Se utiliza la operacion forEach en el usar de los muebles.
Se relaciona con la declaratividad ya que al momento de usar un mueble, disminuimos los atributos elegidos, usando el mensaje forEach, por lo tanto
no le damos importancia a como se ejecuta el mensaje, sino que lo que queremos hacer lo delegamos al motor de wollok.
La ventaja de usar colecciones es que podemos modificar varios atributos de la misma manera con el mismo mensaje.

3- Usamos varias clases, porque nos resultaron utiles para implementar muchos muebles y sus tipos, los cuales reaccionaran de forma similar al interactuar 
con los atributos. A su vez tambien podemos encontrar otras clases segun el tipo de los atributos. Los objetos se instancian al final del archivo muebles.wlk y cada vez que el
juego se inicia. 
La ventaja de usar clases es que podemos crear las instancias que querramos tanto de muebles como atributos y asi profundizar el contenido el juego

4- La herencia se encuentra entre los muebles y sus tipos, es decir, entre Muebles, MuebleElectrico y MuebleMadera, porque necesitabamos que los muebles electricos y
los de madera tengan comportamientos en comun a la hora de ser usados (que disminuyan y aumenten los atributos que conocen) pero a la vez que tengan ciertos comportamientos
distintos (por ejemplo cada vez que un mueble de madera es usado, disminuye su desgaste, en cambio cuando se usa un mueble electrico, existe una posibilidad de que se queme).
Tambien se encuentra entre los tipos de atributos con la clase general de atributos, porque cada atributo general, pertenece a un tipo, este tipo tiene una potencia el cual
determinara el comportamiento del personaje . Ademas, todas las clases que requeriran ser visualizadas, heredan de una clase Visual ya que esta contiene los metodos image()
y position(), que son necesarios para ser mostrados.

El comportamiento que tienen los muebles en comun al ser usados, es reducir y aumentar los atributos que conocen, y se diferencian en que en los muebles de madera,
al ser usados cambia su desgaste y los electricos se pueden quemar. Tambien, al ser reparados, se disminuyen los mismos atributos, pero el mueble de madera aumenta parcialmente
su desgaste, en cambio el electrico queda habilitado para ser usado nuevamente.

5- Los objetos que interactuan en la composicion son las instancias de la clase Atributos los cuales tienen un atributo interno que representa el tipo al que pertenecen.
Estos tipos de atributo son las intancias de las clases TipoAtributo, TipoFisico y TipoMental.
Se delega cuando aumentamos o disminuimos el nivel de los atributos, ya que dependiendo del tipo al que pertenezcan se aumenta o disminuye la potencia asociada al tipo.
Esta potencia determinara el comportamiento del personaje. No implementamos herencia porque si en un futuro queremoa agregar mas tipos de atributos, bastaria con crear un
objeto o clase que entienda los mismos mensajes que los ya creados. Ademas de esta manera, los atributos y sus tipos estan relacionados de forma debil, y no se 
produce un acoplamiento que a la larga puede ser molesto
               
*/

