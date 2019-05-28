import wollok.game.*
class Maiz {
	var esAdulta = false
	var property image = "corn_baby.png"
	var property position

	method estasSiendoRegado(){
		if (not esAdulta){ 
			esAdulta = true
			image = "corn_adult.png" 
		}
	}
	method puedeSerCosechado() = esAdulta
}

class Trigo {
	var property image = "wheat_0.png"
	var etapaEvolucion = [0, 1, 2, 3]
	var property position
	method estasSiendoRegado(){
		etapaEvolucion.add(etapaEvolucion.head())
		etapaEvolucion.remove(etapaEvolucion.head())
		image = "wheat_" + etapaEvolucion.head().toString() + ".png"
	}
	method puedeSerCosechado() = etapaEvolucion.head() >= 2
}

class Tomaco {
	var property image = "tomaco.png"
	var property position 
	method estasSiendoRegado(){
		if (game.height() - 1 == position.y()) {
			position = game.at(position.x(), 0)
		}
		else {
			position = position.up(1)
		}
	}
	method puedeSerCosechado() = true
}