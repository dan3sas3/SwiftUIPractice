//
//  Animal.swift
//  16-feb-22-api
//
//  Created by alumno on 16/02/22.
//

import Foundation

// MARK: - Animal
struct Animal: Decodable, Identifiable {
    let name, latin_name, animal_type, active_time: String
    let length_min, length_max, weight_min, weight_max: String
    let lifespan, habitat, diet, geo_range: String
    let image_link: String
    let id: Int
}
enum AnimalError:Error{
    case URLinvalida
    case sinDatos
}

