import Foundation
import Dia1 // Necessário para Aluno e Instrutor
import Dia2 // Necessário para Aparelho, AulaColetiva e Protocolo Manutencao

func testDia2() {
    print("========================================")
    print("    TESTES DO DIA 2: PROTOCOLOS E AULAS")
    print("========================================")

    // Pré-requisitos
    let instrutor2 = Instrutor(nome: "Pedro Rocha", email: "pedro@academia.com", especialidade: "Musculação")
    let planoTeste = PlanoMensal()
    let aluno2 = Aluno(nome: "Mariana Souza", email: "mariana@aluno.com", matricula: "B002", plano: planoTeste)

    // 1. Teste de Aparelho (Protocolo Manutencao)
    let esteira = Aparelho(nomeItem: "Esteira ProX")
    print("\n--- Teste 2.1: Aparelho e Manutenção ---")
    print("Antes da Manutenção: \(esteira.dataUltimaManutencao)")
    let sucessoManutencao = esteira.realizarManutencao()
    print("Manutenção bem-sucedida? \(sucessoManutencao)")
    print("Após Manutenção: \(esteira.dataUltimaManutencao)")
    
    if sucessoManutencao && esteira.dataUltimaManutencao != "Nenhuma" {
        print("✅ Protocolo Manutencao implementado corretamente.")
    }

    // 2. Teste de Aulas
    let aulaColetiva = AulaColetiva(nome: "Spinning Avançado", instrutor: instrutor2)
    aulaColetiva.capacidadeMaxima = 2 // Capacidade baixa para testar o limite

    print("\n--- Teste 2.2: Lógica de Inscrição em Aula Coletiva ---")
    let aluno3 = Aluno(nome: "Gabriel Lima", email: "gabriel@aluno.com", matricula: "C003", plano: planoTeste)
    let aluno4 = Aluno(nome: "Fernanda Dias", email: "fernanda@aluno.com", matricula: "D004", plano: planoTeste)

    // Tenta Inscrever 1 (Sucesso)
    print("Inscrição de Aluno 2 (Mariana): \(aulaColetiva.inscrever(aluno: aluno2) ? "Sucesso" : "Falha")")
    // Tenta Inscrever 2 (Sucesso - Turma Completa)
    print("Inscrição de Aluno 3 (Gabriel): \(aulaColetiva.inscrever(aluno: aluno3) ? "Sucesso" : "Falha")")
    // Tenta Inscrever 3 (Falha - Turma Lotada)
    print("Inscrição de Aluno 4 (Fernanda): \(aulaColetiva.inscrever(aluno: aluno4) ? "Sucesso" : "Falha")")
    // Tenta Inscrever Aluno 2 novamente (Falha - Já Inscrito)
    print("Re-inscrição de Aluno 2 (Mariana): \(aulaColetiva.inscrever(aluno: aluno2) ? "Sucesso" : "Falha")")
    
    print("\nEstado Final da Aula Coletiva (inscritos: \(aulaColetiva.alunosInscritos.count)):\n\(aulaColetiva.getDescricao())")
    
    if aulaColetiva.alunosInscritos.count == 2 {
        print("✅ Lógica de capacidade e duplicidade correta.")
    } else {
        print("❌ Lógica de capacidade ou duplicidade falhou.")
    }
}

testDia2()