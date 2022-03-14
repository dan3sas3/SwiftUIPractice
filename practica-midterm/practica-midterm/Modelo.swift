//
//  Modelo.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//
import Foundation

// MARK: - DataModel
struct DataModel: Decodable {
    let error: Bool
    let message: String
    let data: [Sucursal]
}

// MARK: - Sucursal
struct Sucursal: Codable {
    let id_sucursal: Int
    let nombre_sucursal, direccion_sucursal: String
    let imagen_sucursal: String
}

struct Response: Codable{
    var id: Int
    var token: String
}

struct ResponseError: Codable{
    var error: String
}


