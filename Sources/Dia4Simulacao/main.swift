// main.swift
@testable import Dia1
@testable import Dia2
@testable import Dia3

// ============================================
// ROTEIRO DE SIMULAÇÃO - DIA 4
// ============================================

print(String(repeating: "=", count: 60))
print("SIMULAÇÃO DO SISTEMA DA ACADEMIA")
print(String(repeating: "=", count: 60))

// 1. Inicialização do Sistema
print("\n[1] Inicializando o sistema...")
let academia = Academia(nome: "Academia POO 360")
print("✓ Academia '\(academia.nome)' criada com sucesso!")

// 2. Criação dos Planos
print("\n[2] Criando planos de matrícula...")
let planoMensal = PlanoMensal()
let planoAnual = PlanoAnual()
print("✓ Plano Mensal: R$ \(planoMensal.calcularMensalidade())/mês")
print("✓ Plano Anual: R$ \(planoAnual.calcularMensalidade())/mês")

// 3. Contratação de Instrutores
print("\n[3] Contratando instrutores...")
let instrutor1 = Instrutor(
    nome: "Carlos Silva",
    email: "carlos@academia.com",
    especialidade: "Musculação"
)
let instrutor2 = Instrutor(
    nome: "Ana Paula",
    email: "ana@academia.com",
    especialidade: "Zumba"
)
academia.contratarInstrutor(instrutor: instrutor1)
academia.contratarInstrutor(instrutor: instrutor2)
print("Instrutores contratados com sucesso!")


// 4. Matrícula de Alunos
print("\n[4] Matriculando alunos...")
let alunoA = academia.matricularAluno(
    nome: "João Pedro",
    email: "joao@email.com",
    matricula: "A001",
    plano: planoMensal
)
let alunoB = academia.matricularAluno(
    nome: "Maria Silva",
    email: "maria@email.com",
    matricula: "A002",
    plano: planoAnual
)
print("Dois alunos matriculados!")

// 5. Criação e Agendamento de Aulas
print("\n[5] Criando e agendando aulas...")
let aulaPersonal = AulaPersonal(
    nome: "Pilates Personal",
    instrutor: instrutor1,
    aluno: alunoA
)
let aulaColetiva = AulaColetiva(
    nome: "Zumba",
    instrutor: instrutor2
)

academia.adicionarAula(aula: aulaPersonal)
academia.adicionarAula(aula: aulaColetiva)
print("✓ Aulas adicionadas ao sistema!")

// 6. Interação com a Aula Coletiva e Lógica de Negócio
print("\n[6] Simulando inscrições na aula coletiva...")
print("\n--- Tentativa 1: Inscrevendo João Pedro ---")
_ = aulaColetiva.inscrever(aluno: alunoA)

print("\n--- Tentativa 2: Inscrevendo Maria Silva ---")
_ = aulaColetiva.inscrever(aluno: alunoB)

print("\n--- Criando e matriculando terceiro aluno ---")
let alunoC = academia.matricularAluno(
    nome: "Pedro Santos",
    email: "pedro@email.com",
    matricula: "A003",
    plano: planoMensal
)

print("\n--- Tentativa 3: Inscrevendo Pedro Santos ---")
_ = aulaColetiva.inscrever(aluno: alunoC)

print("\n--- Criando e matriculando quarto aluno ---")
let alunoD = academia.matricularAluno(
    nome: "Juliana Costa",
    email: "juliana@email.com",
    matricula: "A004",
    plano: planoAnual
)

print("\n--- Tentativa 4: Inscrevendo Juliana Costa (deve falhar) ---")
_ = aulaColetiva.inscrever(aluno: alunoD)

// Listar estado atual do sistema
print("\n" + String(repeating: "=", count: 60))
academia.listarAulas()
print("\n" + String(repeating: "=", count: 60))
academia.listarAlunos()

// 7. Demonstração Prática de Polimorfismo com Aulas
print("\n" + String(repeating: "=", count: 60))
print("[7] DEMONSTRAÇÃO DE POLIMORFISMO - AULAS")
print(String(repeating: "=", count: 60))
let aulasPolimorficas: [Aula] = [aulaPersonal, aulaColetiva]
for (index, aula) in aulasPolimorficas.enumerated() {
    print("\nAula \(index + 1):")
    print(aula.getDescricao())
}

// 8. Demonstração Prática de Polimorfismo com Pessoas
print("\n" + String(repeating: "=", count: 60))
print("[8] DEMONSTRAÇÃO DE POLIMORFISMO - PESSOAS")
print(String(repeating: "=", count: 60))
let pessoasPolimorficas: [Pessoa] = [alunoA, alunoB, instrutor1, instrutor2]
for (index, pessoa) in pessoasPolimorficas.enumerated() {
    print("\nPessoa \(index + 1):")
    print(pessoa.getDescricao())
}

// 9. Criação de um Relatório com Tuplas
print("\n" + String(repeating: "=", count: 60))
print("[9] RELATÓRIO FINAL DA ACADEMIA")
print(String(repeating: "=", count: 60))
let relatorio = academia.gerarRelatorio()
print("\n Estatísticas da Academia POO 360:")
print("   • Total de Alunos: \(relatorio.totalAlunos)")
print("   • Total de Instrutores: \(relatorio.totalInstrutores)")
print("   • Total de Aulas: \(relatorio.totalAulas)")
print("\n" + String(repeating: "=", count: 60))
print("SIMULAÇÃO CONCLUÍDA COM SUCESSO!")
print(String(repeating: "=", count: 60))