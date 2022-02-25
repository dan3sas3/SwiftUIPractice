//
//  operaciones.swift
//  exchange-api
//
//  Created by dansa on 22/02/22.
//

import Foundation
// MARK: - Convertidor
struct Convertidor: Codable {
    let motd: MOTD
    let success: Bool
    let query: Query
    let info: Info
    let historical: Bool
    let date: String
    let result: Double
}

// MARK: - Info
struct Info: Codable {
    let rate: Double
}

// MARK: - MOTD
struct MOTD: Codable {
    let msg: String
    let url: String
}

// MARK: - Query
struct Query: Codable {
    let from: String
    let to: String
    let amount: Double
}

extension Convertidor{
    static let empty = Convertidor(motd: MOTD(msg: "", url: ""), success: false, query: Query(from: "", to: "", amount: -1.0), info: Info(rate: -1), historical: false, date: "", result: -1)
}

enum ConvertidorError: Error{
    case invalidURL
    case missingData
}

class APICall{
    func vacio() async throws -> Convertidor {
        return  Convertidor.empty
    }
    
    func getCurrency(de:String, a:String, monto:Double) async throws -> Convertidor{
        var urlConsumo = "https://api.exchangerate.host/convert"
        urlConsumo = urlConsumo + "?from=" + de + "&to=" + a + "&amount=" + String(format: "%.1f", monto)
        print(urlConsumo)
        guard let url = URL(string: urlConsumo) else{
            throw ConvertidorError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let conv = try JSONDecoder().decode(Convertidor.self, from:data)
        return conv
    }
    
    func getCodigos() async throws -> Symbols {
        let urlConsumo = "https://api.exchangerate.host/symbols"
        guard let url = URL(string: urlConsumo) else{
            throw ConvertidorError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let symb = try JSONDecoder().decode(Symbols.self, from:data)
        return symb
    }
}
