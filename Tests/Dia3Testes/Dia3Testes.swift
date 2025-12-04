import Foundation
@testable import Dia1
@testable import Dia2
@testable import Dia3 // Necessário para a classe Academia

func testDia3() {
    print("========================================")
    print("  TESTES DO DIA 3: GERENCIAMENTO E CONSULTA")
    print("========================================")
    
    let academia = Academia(nome: "Academia Teste Dia 3")
    
    // Planos
    let planoM = PlanoMensal()
    let planoA = PlanoAnual()
    
    // 1. Teste de Sobrecarga de Matrícula e Duplicidade
    print("\n--- Teste 3.1: Sobrecarga e Duplicidade ---")

    // Sobrecarga 1 (Convenience: Cria e Matricula) - Aluno A
    let alunoA = academia.matricularAluno(nome: "Bernardo Costa", email: "bernardo@aluno.com", matricula: "M001", plano: planoM)
    
    // Sobrecarga 2 (Principal: Matricula Objeto) - Aluno Z
    let alunoZ = Aluno(nome: "Zelia Santos", email: "zelia@aluno.com", matricula: "M002", plano: planoA)
    academia.matricularAluno(aluno: alunoZ)
    
    // Tentativa de Duplicidade (Matrícula M001) - Deve falhar
    let alunoDuplicado = Aluno(nome: "Teste Duplicado", email: "duplicado@aluno.com", matricula: "M001", plano: planoM)
    academia.matricularAluno(aluno: alunoDuplicado)
    
    // 2. Adição de Instrutores e Aulas para Teste de Relatório
    let instrutor3 = Instrutor(nome: "Ana Paula", email: "ana@academia.com", especialidade: "Pilates")
    academia.contratarInstrutor(instrutor: instrutor3)
    
    let aula1 = Aula(nome: "Funcional", instrutor: instrutor3)
    academia.adicionarAula(aula: aula1)
    
    // 3. Teste de Consulta e Ordem Alfabética
    print("\n--- Teste 3.2: Busca e Listagem ---")

    // Busca por Matrícula (Sucesso)
    if let alunoEncontrado = academia.buscarAluno(porMatricula: "M002") {
        print("✅ Busca Sucesso: Aluno M002 encontrado: \(alunoEncontrado.nome)")
    }
    
    // Listagem Alfabética (Deve mostrar Bernardo e Zelia)
    academia.listarAlunos()
    academia.listarAulas()

    // 4. Teste de Relatório (Tupla com Extension)
    print("\n--- Teste 3.3: Gerar Relatório (Extension) ---")
    
    let relatorio = academia.gerarRelatorio() // Chamando o método da extension
    
    print("Relatório do Sistema:")
    print("- Total de Alunos: \(relatorio.totalAlunos) (Esperado: 2)")
    print("- Total de Instrutores: \(relatorio.totalInstrutores) (Esperado: 1)")
    print("- Total de Aulas: \(relatorio.totalAulas) (Esperado: 1)")
    
    if relatorio.totalAlunos == 2 && relatorio.totalInstrutores == 1 && relatorio.totalAulas == 1 {
        print("✅ Relatório de Tupla gerado corretamente.")
    }
}

testDia3()