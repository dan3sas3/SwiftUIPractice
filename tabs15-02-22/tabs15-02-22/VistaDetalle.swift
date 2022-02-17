//
//  VistaDetalle.swift
//  tabs15-02-22
//
//  Created by alumno on 16/02/22.
//

import SwiftUI

struct VistaDetalle: View {
    var gato = Gato(id: -1, imageLink:"", altText: "", codeNames: [""])
    var body: some View {
        VStack{
            Text("\(gato.codeNames[0])")
                .font(.system(size: 50))
            AsyncImage(url:URL(string: gato.imageLink)){
                image in image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(20)
            Text(gato.altText + "Other names:  \(gato.codeNames[1]) + and \(gato.codeNames[2])")
                .font(.system(size: 20))
            Spacer()
        }
    }
}

struct VistaDetalle_Previews: PreviewProvider {
    static var previews: some View {
        VistaDetalle()
    }
}
