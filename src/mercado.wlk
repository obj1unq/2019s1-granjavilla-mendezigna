class Mercado {
	const property mercaderiaParaVender = []
	var property dinero
	const property esCultivo = false
	var property image = "market.png"
	method teEstanVendiendo(cultivos){
		cultivos.forEach({cultivo => mercaderiaParaVender.add(cultivo)})
		dinero -= cultivos.sum({cultivo => cultivo.valor()})
	}
}
