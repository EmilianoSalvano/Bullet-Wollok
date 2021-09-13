import wollok.game.*
import example.*

class Disparo {
	var fuente = game.at(50,5)
	method position() = fuente
	method image() = "proyectil2.png"
	method avanzar(){fuente = fuente.up(1)}
}
