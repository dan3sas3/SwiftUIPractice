//
//  DetallesAlumno.swift
//  practica7-danielsastre
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct DetallesAlumno: View {
    
    let alumno: Alumnos
    @State private var nombreAlumno: String = ""
    @State private var carrera: String = ""
    let coreDM: CoreDataManager
    @Binding var necesitaRefresh: Bool
    
    var body: some View {
        VStack {
            Text("Nombre:")
                .multilineTextAlignment(.leading)
            TextField(alumno.nombre ?? "", text: $nombreAlumno)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Carrera")
            TextField(alumno.carrera ?? "", text: $carrera)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Actualiza") {
                if !nombreAlumno.isEmpty{
                    alumno.nombre = nombreAlumno
                    coreDM.update()
                    necesitaRefresh.toggle()
                }
                if !carrera.isEmpty{
                    alumno.carrera = carrera
                    coreDM.update()
                    necesitaRefresh.toggle()
                }
            }// fin Button
        } // fin Vstack
    }// fin view
}

struct DetallesAlumno_Previews: PreviewProvider {
    static var previews: some View {
        let alumno = Alumnos()
        DetallesAlumno(alumno: alumno, coreDM: CoreDataManager(), necesitaRefresh: .constant(false))
    }
    
}
