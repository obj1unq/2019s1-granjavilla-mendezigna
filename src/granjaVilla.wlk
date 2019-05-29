import wollok.game.*

object hector {
	var property position = game.at(0, 0)
	const property plantasParaVender  = []
	var property dinero = 0
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
	method cosechar() {
		if(self.hayCultivo()){
			self.plantasQueSePuedenCosechar().forEach({cultivo => plantasParaVender.add(cultivo)})
			self.plantasQueSePuedenCosechar().forEach({cultivo => game.removeVisual(cultivo)})
		}
		else {game.say(self, "no hay nada para cosechar")}
	}
	method plantasQueSePuedenCosechar(){
		return game.colliders(self).filter({cultivo => cultivo.puedeSerCosechado()})
	}
	method vender() {
		dinero += plantasParaVender.sum({cultivo => cultivo.valor()})
		plantasParaVender.clear()
	}
}