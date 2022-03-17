//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Virgilio De la Cruz on 2/14/21.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var tituloPelicula: String = ""
    @State private var duracion: String = ""
    @State private var peliculas: [Pelicula] = [Pelicula]()
    @State private var necesitaRefresh: Bool = false
    
    private func llenaPeliculas() {
        peliculas = coreDM.getAllPeliculas()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Ingresa el titulo", text: $tituloPelicula)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Ingresa la duracion", text: $duracion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Guardar") {
                    coreDM.savePelicula(titulo: tituloPelicula, duracion:duracion)
                    llenaPeliculas()
                }// fin button
                
                List {
                    
                    ForEach(peliculas, id: \.self) { peli in
                        NavigationLink(
                            destination:
                            DetallePelicula(pelicula: peli, coreDM: coreDM, necesitaRefresh: $necesitaRefresh),
                            label: {
                                Text(peli.titulo ?? "")
                            })//fin label
                    }//fin ForEach
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let peli = peliculas[index]
                            // borrado usando el Core Data Manager
                            coreDM.deletePelicula(Pelicula: peli)
                            llenaPeliculas()
                        } //fin foreach
                    })//fin ondelete
                    
                }//fin List
                .listStyle(PlainListStyle())
                .accentColor(necesitaRefresh ? .white: .black)
                
                
                Spacer()
            } // fin VStack
            .padding()
            .navigationTitle("Peliculas")
            
            .onAppear(perform: {
                llenaPeliculas()
            })
        }// fin NavigationView
    }//fin View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}

