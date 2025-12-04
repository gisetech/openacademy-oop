// Criação do protocolo para manutenção de aparelhos
protocol Manutencao{
    var nomeItem: String {get}
    var dataUltimaManutencao: String {get}
    func realizarManutencao() -> Bool
}