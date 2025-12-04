# openacademy-oop
Repository from the course OOP with Swift

## Diagrama de Classes

```mermaid
classDiagram
    direction LR

    %% Classes do Dia 1: Herança de Pessoas e Planos
    class Pessoa {
        +String nome
        +String email
        +String getDescricao()
    }
    class Aluno {
        +String matricula
        +NivelAluno nivel
        +Plano plano
        +void mudarPlano(Plano)
        +void promoverNivel(NivelAluno)
    }
    class Instrutor {
        +String especialidade
    }
    class NivelAluno {
        <<enumeration>>
        iniciante
        intermediario
        avancado
    }
    class Plano {
        +String nome
        +Double calcularMensalidade()
    }
    class PlanoMensal
    class PlanoAnual

    %% Classes do Dia 2: Protocolo e Aulas
    class Aparelho
    class Manutencao {
        <<protocol>>
        +String nomeItem
        +String dataUltimaManutencao
        +Bool realizarManutencao()
    }
    class Aula {
        +String nome
        +Instrutor instrutor
        +String getDescricao()
    }
    class AulaPersonal {
        +Aluno aluno
    }
    class AulaColetiva {
        -Map~String,Aluno~ alunosInscritos
        +Int capacidadeMaxima
        +Bool inscrever(Aluno)
    }

    %% Classe do Dia 3: Agregação e Gerenciamento
    class Academia {
        -Map~String,Aluno~ alunosMatriculados
        -Map~String,Instrutor~ instrutoresContratados
        -Array~Aparelho~ aparelhos
        -Array~Aula~ aulasDisponiveis
        +void adicionarAparelho(Aparelho)
        +void adicionarAula(Aula)
        +void contratarInstrutor(Instrutor)
        +void matricularAluno(Aluno)
        +Aluno matricularAluno(String, String, String, Plano)
        +Aluno? buscarAluno(String)
        +void listarAlunos()
        +Tuple gerarRelatorio()
    }

    %% Relações de Herança (IS-A)
    Pessoa <|-- Aluno
    Pessoa <|-- Instrutor
    Plano <|-- PlanoMensal
    Plano <|-- PlanoAnual
    Aula <|-- AulaPersonal
    Aula <|-- AulaColetiva

    %% Relação de Contrato (Implements)
    Aparelho ..|> Manutencao

    %% Relações de Composição (HAS-A)

    % Aluno usa Plano (Associação)
    Aluno --> Plano : -plano

    % Aula usa Instrutor (Associação/Composição)
    Aula --> Instrutor : -instrutor

    % AulaPersonal usa Aluno (Composição)
    AulaPersonal --> Aluno : -aluno

    % AulaColetiva usa Aluno (Composição)
    AulaColetiva --> Aluno : -alunosInscritos

    % Academia gerencia coleções (Agregação/Composição)
    Academia "1" *-- "many" Aluno : -alunosMatriculados
    Academia "1" *-- "many" Instrutor : -instrutoresContratados
    Academia "1" *-- "many" Aparelho : -aparelhos
    Academia "1" *-- "many" Aula : -aulasDisponiveis