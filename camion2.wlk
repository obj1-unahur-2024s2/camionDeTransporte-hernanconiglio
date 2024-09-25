import cosas2.*
object camion {
    const property carga = []

    method cargar(algo) { 
        carga.add(algo)
        algo.consecuenciaDeCarga()
    }
    method cargarVariasCosas(listaCosas) {
        carga.addAll(listaCosas)
        listaCosas.forEach({c=>c.consecuenciaDeCarga()})
    }
    method descargar(algo) { carga.remove(algo) }

    method cargaTotal() = carga.sum({c => c.peso()})
    method pesoTotal() = 1000 + self.cargaTotal()
    method pesosDeLaCarga() = carga.map({c => c.peso()})
    method todoPesoImpar() = self.pesosDeLaCarga().all({e=>e.odd()})
    method algoPesa(unValor) = carga.any({c => c.peso() == unValor})
    method algoPesaBis(unValor) = self.pesosDeLaCarga().any({p=>p==unValor})
    method cosaConPeligrosidad(nivel) = 
        carga.find({c => c.peligrosidad() == nivel})
    
    method cosasQueSuperanPeligrosidad(nivel) = 
        carga.filter({c => c.peligrosidad() > nivel})

    method cosasMasPeligrosasQue(unaCosa) =
        carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})

    method excedidoMaximoPeso() = 
        self.pesoTotal() > 2500

    method puedeCircularEnRuta(unValor) = 
        !self.excedidoMaximoPeso() && self.cosasQueSuperanPeligrosidad(unValor).isEmpty()
        
    method tieneAlgoQuePesaEntre(min,max) =
        carga.any({c => c.peso().between(min,max)})

    method cosaMasPesada() = carga.max({c => c.peso()})
}