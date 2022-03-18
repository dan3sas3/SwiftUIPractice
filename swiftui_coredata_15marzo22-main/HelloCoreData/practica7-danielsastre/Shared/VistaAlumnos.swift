//
//  VistaAlumnos.swift
//  practica7-danielsastre
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct VistaAlumnos: View {
    let coreDM: CoreDataManager
    @State private var id: String = ""
    @State private var nombre:String = ""
    @State private var carrera: String = ""
    @State private var alumnos: [Alumnos] = [Alumnos]()
    @State private var necesitaRefresh: Bool = false
    private func llenarAlumnos(){
        alumnos = coreDM.getAllAlumnos()
    }
    var body: some View {
        NavigationView {
                    VStack {
                        TextField("Ingresa el id del alumno", text: $id)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Ingresa el nombre del alumno", text: $nombre)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Ingresa la carrera del alumno", text: $carrera)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Guardar") {
                            coreDM.saveAlumno(id: id, nombre:nombre, carrera: carrera)
                            llenarAlumnos()
                        }// fin button
                        
                        List {
                            ForEach(alumnos, id: \.self) { alumn in
                                NavigationLink(
                                    destination:
                                        DetallesAlumno(alumno:alumn, coreDM: coreDM, necesitaRefresh: $necesitaRefresh),
                                    label: {
                                        Text(alumn.nombre ?? "")
                                    })//fin label
                            }//fin ForEach
                            .onDelete(perform: { indexSet in
                                indexSet.forEach { index in
                                    let alumn = alumnos[index]
                                    // borrado usando el Core Data Manager
                                    coreDM.deleteAlumno(alumno: alumn)
                                    llenarAlumnos()
                                } //fin foreach
                            })//fin ondelete
                            
                        }//fin List
                        .listStyle(PlainListStyle())
                        .accentColor(necesitaRefresh ? .white: .black)
                        
                        
                        Spacer()
                    } // fin VStack
                    .padding()
                    .navigationTitle("Alumnos")
                    
                    .onAppear(perform: {
                        llenarAlumnos()
                    })
                }// fin NavigationView
    }
}

struct VistaAlumnos_Previews: PreviewProvider {
    static var previews: some View {
        VistaAlumnos(coreDM: CoreDataManager())
    }
}
