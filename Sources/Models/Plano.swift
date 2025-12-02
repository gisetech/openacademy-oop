import Foundation

class Plano {
    var nome: String

    init(nome: String) {
        self.nome = nome
    }

    func calcularMensalidade() -> Double {
        fatalError("Subclasses devem sobrescrever calcularMensalidade()")
    }
}
