//
//  ElementListaPersonaje.swift
//  practica4_AldoAyala
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct ElementListaPersonaje: View {

    var character = Personaje(id: -1, name: "", status: "", species: "", type: "", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")

    var body: some View {
        HStack{
            AsyncImage(url: URL(string:character.image)){
                image in image
                    .resizable()
                    .scaledToFit()
            } placeholder:{
                    ProgressView()
            }
            .frame(width:50, height: 50)
            .cornerRadius(20)
            Text(character.name)
            Spacer()
        }
    }
}

struct ElementListaPersonaje_Previews: PreviewProvider {
    static var previews: some View {
        ElementListaPersonaje()
    }
}
