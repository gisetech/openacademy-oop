@testable import Dia1

class AulaColetiva: Aula{
    private (set) var alunosInscritos: [String: Aluno] = [:]
    var capacidadeMaxima: Int

    init(nome: String, instrutor: Instrutor, capacidadeMaxima: Int = 25) {
        self.capacidadeMaxima = capacidadeMaxima
        super.init(nome: nome, instrutor: instrutor)
    }

    func inscrever(aluno: Aluno) -> Bool{
        if self.alunosInscritos.count < capacidadeMaxima {
            if !self.alunosInscritos.keys.contains(aluno.matricula){
                alunosInscritos[aluno.matricula] = aluno
                print("Aluno registrado com sucesso!")
                return true
            } else{
                print("Aluno já registrado")
            }
        } else{
            print("A capacidade máxima de alunos já foi alcançada, falha no registro")
        }

        return false
    }

    override func getDescricao() -> String {
        let descricaoBase = super.getDescricao()
        let vagasOcupadas = alunosInscritos.count
        
    // Incluir número de vagas ocupadas e capacidade máxima
        return "\(descricaoBase) Turma Coletiva: \(vagasOcupadas) de \(capacidadeMaxima) vagas ocupadas."
    }
}