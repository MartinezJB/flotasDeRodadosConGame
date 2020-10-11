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
		return (es10KmMayor and esCapacidadCorrecta and self.esColorCompatible(auto.color()))
	}
	method esColorCompatible(color) { return !self.esColorIncompatible(color) }
	method esColorIncompatible(color) { return coloresIncompatibles.contains(color) }
	method acelerar() { tiempoMaximo -= 1 }
	method relajar() { tiempoMaximo += 1 }
}
