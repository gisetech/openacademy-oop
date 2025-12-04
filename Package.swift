// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "openacademy-oop",
    
    // Define os módulos que podem ser importados
    products: [
        .library(name: "Dia1", targets: ["Dia1"]),
        .library(name: "Dia2", targets: ["Dia2"]),
        .library(name: "Dia3", targets: ["Dia3"]),
        // O Dia4Simulacao é um executável, não precisa ser uma biblioteca
    ],
    
    targets: [
        // MARK: - Módulos de Código (Classes)
        .target(name: "Dia1"),
        .target(
            name: "Dia2",
            dependencies: ["Dia1"] // Dia 2 precisa das classes de Pessoas/Planos
        ),
        .target(
            name: "Dia3",
            dependencies: ["Dia1", "Dia2"] // Dia 3 precisa de Aluno, Instrutor, Aparelho, Aula
        ),

        // MARK: - Módulo Executável de Simulação
        .executableTarget(
            name: "Dia4Simulacao",
            dependencies: ["Dia1", "Dia2", "Dia3"] // Simulação final precisa de tudo
        ),

        // MARK: - Módulos de Teste (Opcional, mas útil para testes modulares)
        .executableTarget(
            name: "Dia1Testes",
            dependencies: ["Dia1"],
            path: "Tests/Dia1Testes"
        ),
        .executableTarget(
            name: "Dia2Testes",
            dependencies: ["Dia1", "Dia2"],
            path: "Tests/Dia2Testes"
        ),
        .executableTarget(
            name: "Dia3Testes",
            dependencies: ["Dia1", "Dia2", "Dia3"],
            path: "Tests/Dia3Testes"
        )
    ]
)