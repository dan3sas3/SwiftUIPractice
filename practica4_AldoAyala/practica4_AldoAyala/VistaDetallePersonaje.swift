//
//  VistaDetallePersonaje.swift
//  practica4_AldoAyala
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct VistaDetallePersonaje: View {
    var character = Personaje(id: -1, name: "", status: "", species: "", type: "", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")
    
    var body: some View {
        VStack{
            Text("\(character.name)")
                .font(.system(size: 50))
            AsyncImage(url: URL(string: character.image)){
                image in image
                    .resizable()
                    .scaledToFit()
            }
            placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            Text("Status: \(character.status) \nSpecies: \(character.species) \nGender: \(character.gender) \nOrigin: \(character.origin.name)")
            Spacer()
        }
    }
}

struct VistaDetallePersonaje_Previews: PreviewProvider {
    static var previews: some View {
        VistaDetallePersonaje()
    }
}
