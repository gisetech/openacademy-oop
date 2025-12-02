import Foundation

class Instrutor: Pessoa {
    let especialidade: String

    init(nome: String,
         email: String,
         especialidade: String) {

        self.especialidade = especialidade
        super.init(nome: nome, email: email)
    }

    override func getDescricao() -> String {
        """
        Instrutor:
        Nome: \(nome)
        Email: \(email)
        Especialidade: \(especialidade)
        """
    }
}
