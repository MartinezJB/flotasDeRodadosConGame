import colores.*
import flotasDeAuto.*
import Pedidos.*

class Dependencia {
	var property cantEmpleados
	const property flota= []
	const property pedidos = []
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() { return flota.sum({ each => each.peso() }) }
	method estaBienEquipada() { return flota.size() >= 3 and flota.all({ each => each.velocidadMaxima() >= 100 }) }
	method capacidadTotalEnColor(color) { return flota.filter({ each => each.color() == color }).sum({ each => each.capacidad() }) }
	method colorDelRodadoMasRapido() { return flota.max({ each => each.velocidadMaxima() }).color() }
	method capacidadFaltante() { return 0.max( cantEmpleados - flota.sum({ each => each.capacidad() }) ) }
	method esGrande() { return cantEmpleados >= 40 and flota.size() >= 5 }
	method agregarPedido(pedido) { pedidos.add(pedido) }
	method quitarPedido(pedido) { pedidos.remove(pedido) }
	method totalPasajerosEnPedidos() { return pedidos.sum({each=>each.cantPasajeros()}) }
	//method pedidosNoSatisfechos() { return pedidos.filter({ each=>each.puedeSatisfacerPedido(flota.map({})) }) } //ARREGLAR
	method todosLosPedidosSonColorIncompatibles(color) { return pedidos.all({each=>each.esColorIncompatible(color)}) }
	method relajarTodoLosPedidos() { pedidos.forEach({each=>each.relajar()}) }
}


