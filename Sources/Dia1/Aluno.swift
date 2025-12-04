import Foundation

class Aluno: Pessoa {
    let matricula: String
    var nivel: NivelAluno
    private(set) var plano: Plano

    init(nome: String,
         email: String,
         matricula: String,
         plano: Plano) {

        self.matricula = matricula
        self.nivel = .iniciante
        self.plano = plano
        super.init(nome: nome, email: email)
    }

    func mudarPlano(_ novoPlano: Plano) {
        self.plano = novoPlano
    }

    func promoverNivel(_ novoNivel: NivelAluno) {
        self.nivel = novoNivel
    }

    override func getDescricao() -> String {
        """
        Aluno:
        Nome: \(nome)
        Email: \(email)
        Matrícula: \(matricula)
        Nível: \(nivel)
        Plano: \(plano.nome)
        Mensalidade: R$ \(String(format: "%.2f", plano.calcularMensalidade()))
        """
    }
}
