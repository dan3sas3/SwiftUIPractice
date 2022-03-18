//
//  DetallesProfesor.swift
//  practica7-danielsastre
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct DetallesProfesor: View {
    
    let profesor: Profesores
    @State private var nombreProfesor: String = ""
    @State private var descripcion: String = ""
    let coreDM: CoreDataManager
    @Binding var necesitaRefresh: Bool
    
    var body: some View {
        VStack {
            Text("Nombre:")
                .multilineTextAlignment(.leading)
            TextField(profesor.nombre ?? "", text: $nombreProfesor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Descripcion CV")
            TextField(profesor.descripcion ?? "", text: $descripcion)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Actualiza") {
                if !nombreProfesor.isEmpty{
                    profesor.nombre = nombreProfesor
                    coreDM.update()
                    necesitaRefresh.toggle()
                }
                if !descripcion.isEmpty{
                    profesor.descripcion = descripcion
                    coreDM.update()
                    necesitaRefresh.toggle()
                }
            }// fin Button
        } // fin Vstack
    }// fin view
}

struct DetallesProfesor_Previews: PreviewProvider {
    static var previews: some View {
        let profesor = Profesores()
        DetallesProfesor(profesor: profesor, coreDM: CoreDataManager(), necesitaRefresh: .constant(false))
    }
    
}
