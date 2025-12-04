class AulaPersonal: Aula{
    public let aluno: Aluno

    public init(nome: String, instrutor: Instrutor, aluno: Aluno){
        self.aluno = aluno
        super.init(nome: nome, instrutor: instrutor)
    }

    public override func getDescricao() -> String {
        // Reutiliza a descrição base e adiciona o aluno específico
        let descricaoBase = super.getDescricao()
        return "\(descricaoBase) Esta é uma aula particular para o aluno \(aluno.nome) (Matrícula: \(aluno.matricula))."
    }
}