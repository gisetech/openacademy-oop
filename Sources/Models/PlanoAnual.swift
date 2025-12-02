import Foundation

class PlanoAnual: Plano {
    init() {
        super.init(nome: "Plano Anual (Promocional)")
    }

    override func calcularMensalidade() -> Double {
        // 20% OFF
        120.0 * 0.8
    }
}
