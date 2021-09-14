import wollok.game.*
import example.*

class Disparo {
	var fuente = game.at(50,5)
	method position() = fuente
	method image() = "proyectil2.png"
	method avanzar(){fuente = fuente.up(1)}
}

class Limites {
	var property position = game.at(-1,0)
	
}