import wollok.game.*
import Disparo.*

object protagonista {
	var position = game.at(0,0)
	var direccion = arriba
	method position() = position
	method image() = "plane50x42.png"
	method avance(dir) { 
		direccion = dir
		game.removeTickEvent("movimiento")
		game.onTick(10, "movimiento", { position = direccion.mover(position) })
	}
	method estabilizar() {
		game.removeTickEvent("movimiento")
		game.onTick(5000, "movimiento", {})
	}
	//method arriba() { position = arriba.mover(position)	}
	//method abajo() { position = abajo.mover(position) }
	//method derecha() { position = derecha.mover(position) }
	//method izquierda() { position = izquierda.mover(position) }
	method disparar() { 
		var disparo = new Disparo(fuente = position)
		disparos.agregarDisparo(disparo)
		game.addVisual(disparo)
		game.onCollideDo(disparo, {algo => game.removeVisual(algo)})
	}
}

object enemigo{
	var position = game.at(100,50)
	method position() = position
	method image() = "veigar 50x65.png"
}

object disparos{
	var property listaDisparos = []
	method avanzar() {listaDisparos.forEach({disparo => disparo.avanzar()} )}
	method agregarDisparo(disparo) {listaDisparos.add(disparo)}
}


object limiteIzquierdo{
	var position = game.at(-1,0)
	method position() = position
	method arriba() { position = position.up(1)	}
	method abajo() { position = position.down(1) }
}

object limiteDerecho{
	var position = game.at(200,0)
	method position() = position
	method arriba() { position = position.up(1)	}
	method abajo() { position = position.down(1) }
}

object limiteSuperior{
	var position = game.at(0,100)
	method position() = position
	method derecha() { position = position.right(1) }
	method izquierda() { position = position.left(1) }
}

object limiteInferior{
	var position = game.at(0,-1)
	method position() = position
	method derecha() { position = position.right(1) }
	method izquierda() { position = position.left(1) }
}

//class Disparo{
//	var fuente = game.at(10,0)
//	method position() = fuente
//	method image() = "proyectil2.png"
//	method avanzar(){fuente = fuente.up(1)}
//}

object arriba{
	method mover(posicion){
		limiteDerecho.arriba()
		limiteIzquierdo.arriba()
		return posicion.up(1)
	}
	
}
object abajo{
	method mover(posicion){
		limiteDerecho.abajo()
		limiteIzquierdo.abajo()
		return posicion.down(1)
	}
	
}
object derecha{
	method mover(posicion){
		limiteSuperior.derecha()
		limiteInferior.derecha()
		return posicion.right(1)
	}
	
}
object izquierda{
	method mover(posicion){
		limiteSuperior.izquierda()
		limiteInferior.izquierda()
		return posicion.left(1)
	}
	
}