@testable import Dia1
@testable import Dia2

class Academia { 
    
    // Propriedades de Armazenamento 
    let nome: String // 
    
    // Todas as coleções devem ser privadas 
    private var alunosMatriculados: [String: Aluno] = [:] // Chave: Matrícula 
    private var instrutoresContratados: [String: Instrutor] = [:] // Chave: Email 
    private var aparelhos: [Aparelho] = [] // Array de Aparelhos 
    private var aulasDisponiveis: [Aula] = [] // Array de Aulas 

    init(nome: String) { 
        self.nome = nome 
        print("Sistema da Academia '\(nome)' inicializado.")
    }

    // MARK: - Métodos de Gerenciamento (Adicionar/Contratar)
    
    func adicionarAparelho(aparelho: Aparelho) { 
        aparelhos.append(aparelho)
        print("Aparelho '\(aparelho.nomeItem)' adicionado à lista de inventário.")
    }

    func adicionarAula(aula: Aula) { 
        aulasDisponiveis.append(aula)
        print("Aula '\(aula.nome)' adicionada à grade de horários.")
    }

   func contratarInstrutor(instrutor: Instrutor) { 
        instrutoresContratados[instrutor.email] = instrutor
        print("Instrutor \(instrutor.nome) contratado com sucesso. Email: \(instrutor.email).")
    }

    // MARK: - Matrícula de Alunos (Sobrecarga de Métodos) 
    
    // 1. Primeiro Método (Principal) 
    func matricularAluno(aluno: Aluno) { 
        // 1. Verifique se a matrícula já existe 
        if alunosMatriculados[aluno.matricula] != nil {
            // 2. Imprima uma mensagem de erro específica 
            print("Erro de Matrícula: Aluno com matrícula \(aluno.matricula) já existe.")
        } else {
            // 3. Adicione o aluno e imprima sucesso 
            alunosMatriculados[aluno.matricula] = aluno
            print("Aluno \(aluno.nome) matriculado com sucesso! Matrícula: \(aluno.matricula).")
        }
    }
    
    // 2. Segundo Método (Conveniência) 
    func matricularAluno(nome: String, email: String, matricula: String, plano: Plano) -> Aluno { 
        // 1. Crie uma nova instância da classe Aluno 
        let novoAluno = Aluno(nome: nome, email: email, matricula: matricula, plano: plano)
        
        // 2. Reutilize o primeiro método para executar a lógica de verificação e adição 
        self.matricularAluno(aluno: novoAluno)
        
        // 3. Retorne a instância do Aluno
        return novoAluno
    }

   // MARK: - Métodos de Consulta (Busca e Listagem) 

    func buscarAluno(porMatricula matricula: String) -> Aluno? { 
        // Realiza busca no dicionário e retorna o Aluno correspondente 
        return alunosMatriculados[matricula] // Retorna Aluno ou nil se não encontrado 
    }
    
    func listarAlunos() { 
        print("\n--- Lista de Alunos Matriculados em \(nome) ---") 
        
        if alunosMatriculados.isEmpty {
            print("Nenhum aluno matriculado.")
        } else {
            // Lista em ordem alfabética 
            let alunosOrdenados = alunosMatriculados.values.sorted { $0.nome < $1.nome }

            for aluno in alunosOrdenados {
                // Imprime o resultado de getDescricao()
                print(aluno.getDescricao())
                print("---")
            }
        }
        print("-------------------------------------------\n") 
    }
    
    func listarAulas() {
        print("\n--- Lista de Aulas Disponíveis em \(nome) ---")
        
        if aulasDisponiveis.isEmpty {
            print("Nenhuma aula disponível.")
        } else {
            // Percorre o array e imprime a descrição 
            for aula in aulasDisponiveis {
                print(aula.getDescricao())
                print("---")
            }
        }
      print("-------------------------------------------\n") 
    }
}

// MARK: - Extension para Relatório (Dia 4, Passo 9.1)

extension Academia {
    
    // Retorna uma tupla nomeada 
    func gerarRelatorio() -> (totalAlunos: Int, totalInstrutores: Int, totalAulas: Int) { 
        
        // Retorna a contagem das propriedades 
        return (
            totalAlunos: alunosMatriculados.count,
            totalInstrutores: instrutoresContratados.count,
            totalAulas: aulasDisponiveis.count
        )
    }
}
