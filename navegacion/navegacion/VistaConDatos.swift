//
//  VistaConDatos.swift
//  navegacion
//
//  Created by alumno on 09/02/22.
//

import SwiftUI
struct VistaConDatos: View{
    var dato1: String
    var dato2: String
    var body: some View{
        VStack{
            Text("Me llegaron estos datos:")
            Text("\(dato1)")
            Text("\(dato2)")
        }
    }
}
