//
//  CharacterDetailed.swift
//  practica4-api
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct CharacterDetailed: View {
    var character = Character(id: -1, name: "", status: "", species: "", type: "", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")
    
    var body: some View {
        VStack{
            Text("\(character.name)")
                .font(.system(size:50))
            AsyncImage(url:URL(string:character.image)){
                image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            Text("Status:" + character.status)
                .font(.system(size:20))
            Text("Species:" + character.species)
                .font(.system(size:20))
            Text("Gender:" + character.gender)
                .font(.system(size:20))
            Text("Origin:"+character.origin.name)
                .font(.system(size:20))
            Spacer()
        }
    }
}

struct CharacterDetailed_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailed()
    }
}
