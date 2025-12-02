import Foundation

enum NivelAluno: CustomStringConvertible {
    case iniciante
    case intermediario
    case avancado
    
    var description: String {
        switch self {
        case .iniciante: return "Iniciante"
        case .intermediario: return "Intermediário"
        case .avancado: return "Avançado"
        }
    }
}
