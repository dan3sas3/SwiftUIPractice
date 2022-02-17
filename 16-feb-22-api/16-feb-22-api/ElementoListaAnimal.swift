//
//  ElementoListaAnimal.swift
//  16-feb-22-api
//
//  Created by alumno on 16/02/22.
//

import SwiftUI

struct ElementoListaAnimal: View {
    var animal = Animal(name: "", latin_name: "", animal_type: "", active_time: "", length_min: "", length_max: "", weight_min: "", weight_max: "", lifespan: "", habitat: "", diet: "", geo_range: "", image_link: "", id: -1)
    var body: some View {
        HStack{
            AsyncImage(url: URL(string:animal.image_link)){
                image in image
                    .resizable()
                    .scaledToFill()
            } placeholder:{
                    ProgressView()
            }
            .frame(width:50, height: 50)
            .cornerRadius(20)
            Text(animal.name)
            Spacer()
        }
    }
}

struct ElementoListaAnimal_Previews: PreviewProvider {
    static var previews: some View {
        ElementoListaAnimal()
    }
}
