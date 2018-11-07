import remeras.*


class Sucursal {	
	var property pedidos = []
	var property cantidadMinima = 0
	
	method agregarPedido(pedido) = pedidos.add(pedido)
	
	method aplicaDescuento(pedido) = cantidadMinima <= pedido.remeras().size()
	
	method totalRecaudadoPorPedidos() = pedidos.sum { pedido => pedido.precio() }
	
	
	
}

class Pedido {
	var property sucursal
	var property remeras = []
	
	method agregarRemera(remera) = remeras.add(remera)
	
	method precioBase() = remeras.sum { remera => remera.costo() } * remeras.size()
	
	method precio() = if ( sucursal.aplicaDescuento(self) ) self.precioBase() - self.calcularDescuento()
	                           else self.precioBase()
	 
	
    method calcularDescuento() = self.precioBase() * self.porcentaje() / 100 

	method porcentaje() = remeras.sum { remera => remera.porcentaje() }
	
	
	method sonRemerasDelMismoColor(color) = remeras.all { remera => remera.color() == color } 
	
	method existePedido() = sucursal.pedidos().contains(self) 
}
