class RemeraLisa {
	// TODO Estas inicializaciones de atributos en valores no-útiles... no son útiles. Evitalas.
	var property talle = 0
	var property color = ""
	
	method costo() = if ( talle >= 32 and talle <= 40 ) self.valorRemeraBasica()
	                       else self.valorRemeraColorida()
	

	// TODO Código repetido y nombres mal puestos.	
	method valorRemeraBasica() = if (color == "Blanco" or color == "Negro" or color == "Gris") 80
	                             else 80 + 8  
	
	method valorRemeraColorida() = if (color == "Blanco" or color == "Negro" or color == "Gris") 100
	                            else 100 + 10                              

    method porcentaje() = 10
}	                                               	                     	
		


class RemeraBordada inherits RemeraLisa {
	var property bordados
	
	method costoDelBordado() = if (bordados.size() * 10 < 20 ) 20
	                          else bordados.size()
	
	override method costo() = super() + self.costoDelBordado()
	
	override method porcentaje() = 2
}

class RemeraSublimada inherits RemeraLisa {
	var property dibujo
	// TODO Este atributo debería ser de la empresa, no de la remera
	var property tieneConvenio
	
	override method costo() = super() + self.costoDelSublimado() + dibujo.derechosDeAutor()
	
	method costoDelSublimado() = dibujo.alto() * dibujo.ancho() * 0.5
	
	override method porcentaje() = if ( tieneConvenio ) 20
	                               else 10 
}

class EmpresaDeDibujo {
	var property alto = 0
	var property ancho = 0
	
	method derechosDeAutor() = 100
}
