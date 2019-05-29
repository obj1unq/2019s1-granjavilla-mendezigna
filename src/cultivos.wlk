import wollok.game.*

class Cultivo {
	const property esCultivo = true
}
class Maiz inherits Cultivo{
	var esAdulta = false
	var property image = "corn_baby.png"
	var property position
	const property valor = 150
	method estasSiendoRegado(){
		if (not esAdulta){ 
			esAdulta = true
			image = "corn_adult.png" 
		}
	}
	method puedeSerCosechado() = esAdulta
}

class Trigo inherits Cultivo{
	var property image = "wheat_0.png"
	var etapas = [0, 1, 2, 3]
	var property position
	method estasSiendoRegado(){
		etapas.add(self.etapa())
		etapas.remove(self.etapa())
		image = "wheat_" + self.etapa().toString() + ".png"
	}
	method etapa() = etapas.head()
	method puedeSerCosechado() = self.etapa() >= 2
	method valor() = self.etapa() -1 * 100
}

class Tomaco inherits Cultivo{
	var property image = "tomaco.png"
	var property position 
	const property valor = 80
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