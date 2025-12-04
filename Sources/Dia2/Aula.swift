// Definição da estrutura de aulas 
@testable import Dia1

class Aula {
    let nome: String
    var instrutor: Instrutor

    init(nome: String, instrutor: Instrutor){
        self.nome = nome
        self.instrutor = instrutor
    }

    public func getDescricao() -> String { 
        return "Aula de \(nome) com o instrutor \(instrutor.nome)." 
    }
}