import colores.*
import flotasDeAuto.*

class Dependencia {
	var property cantEmpleados
	const property flota= []
	
	method agregarAFlota(rodado) { flota.add(rodado) }
	method quitarDeFlota(rodado) { flota.remove(rodado) }
	method pesoTotalFlota() { return flota.sum({ each => each.peso() }) }
	method estaBienEquipada() { return flota.size() >= 3 and flota.all({ each => each.velocidadMaxima() >= 100 }) }
	method capacidadTotalEnColor(color) { return flota.filter({ each => each.color() == color }).sum({ each => each.capacidad() }) }
	method colorDelRodadoMasRapido() { return flota.max({ each => each.velocidadMaxima() }).color() }
	method capacidadFaltante() { return 0.max( cantEmpleados - flota.sum({ each => each.capacidad() }) ) }
	method esGrande() { return cantEmpleados >= 40 and flota.size() >= 5 }
}
