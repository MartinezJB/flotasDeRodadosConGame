import colores.*
import flotasDeAuto.*


class Pedido {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantPasajeros
	var property coloresIncompatibles = #{}
	
	method agregarColor(color) { coloresIncompatibles.add(color) }
	method velocidadRequerida() { return distanciaARecorrer / tiempoMaximo }
	method puedeSatisfacerPedido(auto) {
		const es10KmMayor = auto.velocidadMaxima()  >= self.velocidadRequerida() + 10
		const esCapacidadCorrecta = auto.capacidad() >= self.cantPasajeros()
		const esColorCompatible = !self.coloresIncompatibles().contains(auto.color())
		return (es10KmMayor and esCapacidadCorrecta and esColorCompatible)
	}
	method acelerar() { tiempoMaximo -= 1 }
	method relajar() { tiempoMaximo += 1 }
}
