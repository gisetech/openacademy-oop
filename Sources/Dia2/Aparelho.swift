// Criação classe Aparelho
class Aparelho: Manutencao{
    let nomeItem: String
    private (set) var dataUltimaManutencao: String

    // Construtor da classe
    init(nomeItem: String){
        self.nomeItem = nomeItem
    }

    // Função retorna booleano a depender se a manutenção foi bem sucessida (true) ou não (false)
    func realizarManutencao() -> Bool{
        print("Manutenção em andamento...")
        print("1...")
        print("2...")
        print("3...")
        print("Manutenção realizada!")

        self.dataUltimaManutencao = "30/08/2025"

        return true 
    }
}