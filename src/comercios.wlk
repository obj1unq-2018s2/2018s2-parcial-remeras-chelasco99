import remeras.*
import sucursales.*

class Comercio {
	
	var property sucursales
	var property pedidosRealizados
	
	method registrarPedido(pedido) = if ( pedido.existePedido())
	                                     pedidosRealizados.add(pedido)
	                                 else self.error( "No existe el pedido"  )   
	
	method totalFacturado() = sucursales.sum { sucursal => sucursal.totalRecaudadoPorPedidos() }
	
	method totalFacturadoDeSucursal(sucursal) = sucursal.pedidos().sum { pedido => pedido.precio() }
	
	method pedidosRealizadosDeColor(color) = pedidosRealizados.count { pedido => pedido.sonRemerasDelMismoColor(color) }
	
	method pedidoMasCaro() = pedidosRealizados.max { pedido => pedido.precio() }
	
	method sucursalQueMasFacturo() = sucursales.max { sucursal => sucursal.totalFacturadoDeSucursal() }


	
	
}