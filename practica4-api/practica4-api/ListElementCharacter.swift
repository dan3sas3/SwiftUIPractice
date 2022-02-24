//
//  ListElementCharacter.swift
//  practica4-api
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct ListElementCharacter: View {
    var character = Character(id: -1, name: "", status:"", species:"", type:"", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")
    var body: some View {
        HStack{
            AsyncImage(url: URL(string:character.image)){
                image in image
                    .resizable()
                    .scaledToFill()
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


struct ListElementCharacter_Previews: PreviewProvider {
    static var previews: some View{
        ListElementCharacter()
    }
}
