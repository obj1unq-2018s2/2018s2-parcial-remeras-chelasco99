import remeras.*
import sucursales.*

class Comercio {
	
	var property sucursales
	var property pedidosRealizados

	// TODO Esto no corresponde al enunciado y no tiene mucho sentido.	
	method registrarPedido(pedido) = if ( pedido.existePedido())
	                                     pedidosRealizados.add(pedido)
	                                 else self.error( "No existe el pedido"  )   
	
	method totalFacturado() = sucursales.sum { sucursal => sucursal.totalRecaudadoPorPedidos() }

	// TODO Esto debería delegar en sucursal, que de hecho ya tiene la funcionalidad.	
	method totalFacturadoDeSucursal(sucursal) = sucursal.pedidos().sum { pedido => pedido.precio() }
	
	method pedidosRealizadosDeColor(color) = pedidosRealizados.count { pedido => pedido.sonRemerasDelMismoColor(color) }
	
	method pedidoMasCaro() = pedidosRealizados.max { pedido => pedido.precio() }
	
	method sucursalQueMasFacturo() = sucursales.max { sucursal => sucursal.totalFacturadoDeSucursal() }  // TODO Manda mensaje inexistente.


	
	
}