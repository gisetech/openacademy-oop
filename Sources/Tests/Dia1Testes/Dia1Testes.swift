import Foundation
import Dia1 // Importa todas as classes do Dia 1

func testDia1() {
    print("========================================")
    print("      TESTES DO DIA 1: BASES POO")
    print("========================================")

    // 1. Criação de Planos
    let planoMensal = PlanoMensal()
    let planoAnual = PlanoAnual()

    print("\n--- Teste 1.1: Cálculo de Planos ---")
    let mensalidadeMensal = planoMensal.calcularMensalidade() // Esperado: 120.0
    let mensalidadeAnual = planoAnual.calcularMensalidade()   // Esperado: 96.0

    print("Plano Mensal (R$ 120.00): R$ \(String(format: "%.2f", mensalidadeMensal))")
    print("Plano Anual (R$ 96.00): R$ \(String(format: "%.2f", mensalidadeAnual))")
    
    if mensalidadeAnual == 96.0 {
        print("✅ Cálculo Anual (Desconto de 20%) Correto.")
    } else {
        print("❌ Cálculo Anual Incorreto. Esperado: R$ 96.00. Recebido: R$ \(mensalidadeAnual).")
    }

    // 2. Criação de Pessoas (Polimorfismo Básico)
    let instrutor1 = Instrutor(nome: "Julia Alvez", email: "julia@academia.com", especialidade: "Yoga")
    let aluno1 = Aluno(nome: "Carlos Silva", email: "carlos@aluno.com", matricula: "A001", plano: planoAnual)
    
    print("\n--- Teste 1.2: Herança e Descrição ---")
    print("Instrutor (getDescricao):\n\(instrutor1.getDescricao())")
    print("\nAluno (getDescricao):\n\(aluno1.getDescricao())")

    // 3. Teste de Nível e plano (private set)
    print("\n--- Teste 1.3: Propriedades do Aluno ---")
    print("Nível Inicial do Aluno: \(aluno1.nivel)")
    print("Plano Acessível (Leitura): \(aluno1.plano.nome)")
    print("✅ Classes Aluno e Instrutor acessíveis via Módulo Dia1.")
}

testDia1()