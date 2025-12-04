# openacademy-oop
Repository from the course OOP with Swift

## Diagrama de Classes

```mermaid
classDiagram
    class Pessoa {
        -nome: String
        -email: String
        +init(nome: String, email: String)
        +getDescricao() String
    }

    class Aluno {
        +matricula: String
        +nivel: NivelAluno
        -plano: Plano
        +init(nome: String, email: String, matricula: String, plano: Plano)
        +mudarPlano(novoPlano: Plano)
        +promoverNivel(novoNivel: NivelAluno)
        +getDescricao() String
    }

    class Instrutor {
        +especialidade: String
        +init(nome: String, email: String, especialidade: String)
        +getDescricao() String
    }

    class Plano {
        +nome: String
        +init(nome: String)
        +calcularMensalidade() Double
    }

    class PlanoMensal {
        +init()
        +calcularMensalidade() Double
    }

    class PlanoAnual {
        +init()
        +calcularMensalidade() Double
    }

    class NivelAluno {
        <<enumeration>>
        iniciante
        intermediario
        avancado
    }

    Pessoa <|-- Aluno
    Pessoa <|-- Instrutor

    Plano <|-- PlanoMensal
    Plano <|-- PlanoAnual

    Aluno --> Plano
    Aluno --> NivelAluno

