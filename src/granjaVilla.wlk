import wollok.game.*

object hector {
	var property position = game.at(0, 0)
	
	method image() = "player.png"
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	method sembrar(semilla) {
		game.addVisual(semilla)
	}
	method regar(){
		if (self.hayCultivo()) {
			game.colliders(self).forEach({cultivo => cultivo.estasSiendoRegado()})
		}
		else {
			game.say(self, "no tengo nada para regar")
		}
	}
	method hayCultivo() {
		return not game.colliders(self).isEmpty()
	}
}