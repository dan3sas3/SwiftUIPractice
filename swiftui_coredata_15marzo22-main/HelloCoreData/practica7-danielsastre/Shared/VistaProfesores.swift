//
//  VistaProfesores.swift
//  practica7-danielsastre
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct VistaProfesores: View {
    let coreDM: CoreDataManager
    @State private var id: String = ""
    @State private var nombre:String = ""
    @State private var descripcion: String = ""
    @State private var profesores: [Profesores] = [Profesores]()
    @State private var necesitaRefresh: Bool = false
    private func llenarProfesores(){
        profesores = coreDM.getAllProfesores()
    }
    var body: some View {
        NavigationView {
                    VStack {
                        TextField("Ingresa el id del profesor", text: $id)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Ingresa el nombre del profesor", text: $nombre)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Ingresa descripcion de CV del profesor", text: $descripcion)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Guardar") {
                            coreDM.saveProfesor(id: id, nombre:nombre, descripcion: descripcion)
                            llenarProfesores()
                        }// fin button
                        
                        List {
                            ForEach(profesores, id: \.self) { prof in
                                NavigationLink(
                                    destination:
                                        DetallesProfesor(profesor:prof, coreDM:coreDM, necesitaRefresh: $necesitaRefresh),
                                    label: {
                                        Text(prof.nombre ?? "")
                                    })//fin label
                            }//fin ForEach
                            .onDelete(perform: { indexSet in
                                indexSet.forEach { index in
                                    let prof = profesores[index]
                                    // borrado usando el Core Data Manager
                                    coreDM.deleteProfesor(profesor: prof)
                                    llenarProfesores()
                                } //fin foreach
                            })//fin ondelete
                            
                        }//fin List
                        .listStyle(PlainListStyle())
                        .accentColor(necesitaRefresh ? .white: .black)
                        
                        
                        Spacer()
                    } // fin VStack
                    .padding()
                    .navigationTitle("Profesores")
                    
                    .onAppear(perform: {
                        llenarProfesores()
                    })
                }// fin NavigationView
    }
}

struct VistaProfesores_Previews: PreviewProvider {
    static var previews: some View {
        VistaProfesores(coreDM: CoreDataManager())
    }
}



