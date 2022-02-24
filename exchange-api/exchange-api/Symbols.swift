//
//  Symbols.swift
//  exchange-api
//
//  Created by alumno on 23/02/22.
//

import Foundation
// MARK: - Symbols
struct Symbols: Codable {
    let motd: MOTD
    let success: Bool
    let symbols: [String: Symbol]
}

// MARK: - Symbol
struct Symbol: Codable {
    let symbolDescription, code: String

    enum CodingKeys: String, CodingKey {
        case symbolDescription = "description"
        case code
    }
}
