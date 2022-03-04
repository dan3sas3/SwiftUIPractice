
import Foundation

// MARK: - DataModel
struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [Platillo]
}

// MARK: - Platillo
struct Platillo: Codable {
    let id_platillo: Int
    let nombre, descripcion, precio: String
    let foto: String

}
