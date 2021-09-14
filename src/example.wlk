import wollok.game.*
import Disparo.*

object protagonista {
	var ejeX = 1
	var ejeY = 1
	method ejeX() {return ejeX}
	method ejeY() {return ejeY}
	
	method position() = game.at(ejeX,ejeY)
	method image() = "plane50x42.png"
	method vertical(y) { 
		game.removeTickEvent("movimiento")
		game.onTick(30, "movimiento", { ejeY = ejeY + y })
	}
	method horizontal(x) { 
		game.removeTickEvent("movimiento")
		game.onTick(30, "movimiento", { ejeX = ejeX + x })
	}
	method estabilizar() {
		game.removeTickEvent("movimiento")
		game.onTick(5000, "movimiento", {})
	}
	method disparar() { 
		var disparo = new Disparo(fuente = self.position())
		disparos.agregarDisparo(disparo)
		game.addVisual(disparo)
		game.onCollideDo(disparo, {enemigo => game.removeVisual(enemigo)})
	}
}

object enemigo{
	var position = game.at(30,80)
	method position() = position
	method image() = "veigar 50x65.png"
}

object disparos{
	var property listaDisparos = []
	method avanzar() {listaDisparos.forEach({disparo => disparo.avanzar()} )}
	method agregarDisparo(disparo) {listaDisparos.add(disparo)}
}


object limiteIzquierdo{  
	method position() = game.at(0,protagonista.ejeY())
	method estabilizar(){}
}

object limiteDerecho{  
	method position() = game.at(50,protagonista.ejeY())
	method estabilizar(){}
}

object limiteSuperior{ 
	method position() = game.at(protagonista.ejeX(),70)
	method estabilizar(){}
}

object limiteInferior{ 
	method position() = game.at(protagonista.ejeX(),0)
	method estabilizar(){}
}




//Esta solucion me da error de overflow

class Coordenada{
	const position = game.at(0,0)
	method position() = position
}

object tablero{
	var property posiciones = []
	method nuevaPosicion(x,y){posiciones.add(new Coordenada(position = game.at(x,y)))}
	method generar(x,y){
		if(x!=10){
			self.nuevaPosicion(x,y)
			self.generar(x+1,y)
		}
		else
		if(y!=20){
			self.generar(0,y+1)
		}
		else{}
	}
}