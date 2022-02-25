//
//  Dog.swift
//  practica5_DanielSastre
//
//  Created by alumno on 25/02/22.
//

import Foundation

// MARK: - Dog
struct Dog: Codable {
    let message: [String: [String]]
    let status: String
}
struct DogImage: Codable{
    let message: String
    let status: String
}
extension Dog{
    static let empty = Dog(message: [:], status:"")
}
extension DogImage{
    static let empty = DogImage(message:"", status:"")
}

enum DogError: Error{
    case invalidURL
    case missingData
}

class APICall{
    func vacio() async throws -> Dog{
        return Dog.empty
    }
    
    func getImage(raza:String) async throws -> DogImage{
        let urlConsumo = "https://dog.ceo/api/breed/"+raza+"/images/random"
        print(urlConsumo)
        guard let url = URL(string: urlConsumo) else {
            throw DogError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from:url)
        let image = try JSONDecoder().decode(DogImage.self, from: data)
        return image
    }
    
    func getRazas() async throws -> Dog{
        let urlConsumo = "https://dog.ceo/api/breeds/list/all"
        guard let url = URL(string:urlConsumo) else{
            throw DogError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let razas = try JSONDecoder().decode(Dog.self, from: data)
        return razas
    }
}
