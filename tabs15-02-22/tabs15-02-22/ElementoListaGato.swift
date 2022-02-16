//
//  ElementoListaGato.swift
//  tabs15-02-22
//
//  Created by alumno on 15/02/22.
//

import SwiftUI

struct ElementoListaGato: View {
    var gato = Gato(id:-1, imageLink: "", altText:"", codeNames:[""])
    var body: some View {
        HStack{
            AsyncImage(url:URL(string:gato.imageLink)){
                image in image
                    .scaledToFill()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width:50, height:50)
            .cornerRadius(20)
            Text(gato.codeNames[0])
            Spacer()
        }//HStack
    }
}

