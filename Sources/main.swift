// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let planoMensal = PlanoMensal()
let planoAnual = PlanoAnual()

let aluno = Aluno(
    nome: "Pedro",
    email: "pedro@gmail.com",
    matricula: "SM23",
    plano: planoMensal
)

let instrutor = Instrutor(
    nome: "Diogo",
    email: "diogo@gmail.com",
    especialidade: "Musculação"
)

print(aluno.getDescricao())
print()
print(instrutor.getDescricao())
print()
print("Plano Mensal: R$ \(String(format: "%.2f", planoMensal.calcularMensalidade()))")
print("Plano Anual:  R$ \(String(format: "%.2f", planoAnual.calcularMensalidade()))")



