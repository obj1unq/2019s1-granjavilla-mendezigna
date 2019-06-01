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
			self.cultivos().forEach({cultivo => cultivo.estasSiendoRegado()})
		}
		else {
			game.say(self, "no tengo nada para regar")
		}
	}
	method hayCultivo() {
		return game.colliders(self).any({objeto => objeto.esCultivo()})
	}
	method cultivos() = game.colliders(self).filter({objeto => objeto.esCultivo()})
	method cosechar() {
		if(self.hayCultivo()){
			self.plantasQueSePuedenCosechar().forEach({cultivo => plantasParaVender.add(cultivo)})
			self.plantasQueSePuedenCosechar().forEach({cultivo => game.removeVisual(cultivo)})
		}
		else {game.say(self, "no hay nada para cosechar")}
	}
	method plantasQueSePuedenCosechar(){
		return self.cultivos().filter({cultivo => cultivo.puedeSerCosechado()})
	}
	method vender() {
		if (not self.estoyEnUnMercado()) {
			game.say(self, "no estoy en un mercado")
		}
		else if (self.mercadoEnElQueEstoy().dinero() < self.valorDeLasPlantas()){
			game.say(self, "el mercado no tiene dinero")
		}
		else {
			self.mercadoEnElQueEstoy().teEstanVendiendo(plantasParaVender)
			dinero += self.valorDeLasPlantas()
			plantasParaVender.clear()
			
			}
	}
	method estoyEnUnMercado() {
		return game.colliders(self).any({objeto => not objeto.esCultivo()})
	}
	method mercadoEnElQueEstoy(){
		return game.colliders(self).find({objeto => not objeto.esCultivo()})
	}
	method valorDeLasPlantas() = plantasParaVender.sum({cultivo => cultivo.valor()})
	method hablar(){
		game.say(self, "tengo " + self.plantasParaVender().size() + "plantas para vender y " + self.dinero() + " monedas")
	}
}