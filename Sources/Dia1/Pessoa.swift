import Foundation

class Pessoa {
    var nome: String
    var email: String

    init(nome: String, email: String) {
        self.nome = nome
        self.email = email
    }

    func getDescricao() -> String {
        """
        Informações Pessoais:
        Nome: \(nome)
        Email: \(email)
        """
    }
}
