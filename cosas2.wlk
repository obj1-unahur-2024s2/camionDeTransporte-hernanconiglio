object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuenciaDeCarga() {}
}

object bumblebee {
    var modoAuto = true
    method peso() = 800
    method peligrosidad() = if(modoAuto) 15 else 30
    method transformarseEnAuto() {modoAuto = true}
    method transformarseEnRobot() {modoAuto = false}
    //method transformarse() { modoAuto = !modoAuto }
    method estaEnModoAuto() = modoAuto
    method bultos() = 2
    method consecuenciaDeCarga() {
        self.transformarseEnRobot()
    }
}

object ladrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
    method bultos() = if(cantidad<=100) {1} 
                      else if (cantidad.between(101,300)) {2}
                      else {3}
    method consecuenciaDeCarga() {
        cantidad += 12
    }
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
    method bultos() = 1
    method consecuenciaDeCarga() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var property estaConMisiles = false
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0
    method bultos() = if(estaConMisiles) 2 else 1
    method consecuenciaDeCarga() {self.estaConMisiles(true)}
}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa) {cosas.add(unaCosa)}
    method quitarCosa(unaCosa) {cosas.remove(unaCosa)}
    method agregarVariasCosas(listaDeCosas) {cosas.addAll(listaDeCosas)}
    method peso() = 100 + cosas.sum({c=>c.peso()})
    method peligrosidad() = 
        if(cosas.isEmpty()) 0 else cosas.max({c=>c.peligrosidad()}).peligrosidad()

    method bultos() = 1 + cosas.sum({c=>c.bultos()})
    method consecuenciaDeCarga() {
        cosas.forEach({c=>c.consecuenciaDeCarga()})
    }
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bultos() = 1
    method consecuenciaDeCarga() {peso += 15}
}

object embalaje {
    var property cosaEnvuelta = arena
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
    method bultos() = 2
    method consecuenciaDeCarga() {}
}
