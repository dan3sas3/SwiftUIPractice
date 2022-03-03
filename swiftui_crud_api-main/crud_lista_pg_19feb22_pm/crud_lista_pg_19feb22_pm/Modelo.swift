
import Foundation
// MARK: - DataModel
struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [DataFruit]
}

// MARK: - Datum
struct DataFruit: Decodable {
    let clave_fruits: Int
    let nombre_fruits: String
    let tipo_fruits: String

}
