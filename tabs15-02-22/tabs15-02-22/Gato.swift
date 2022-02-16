//
//  Gato.swift
//  tabs15-02-22
//
//  Created by alumno on 15/02/22.
//
import Foundation

// MARK: - GatoElement
struct Gato: Decodable, Identifiable{
    let id: Int
    let imageLink: String
    let altText: String
    let codeNames: [String]
}


