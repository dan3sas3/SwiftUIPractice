//
//  DetallePelicula.swift
//  HelloCoreData
//
//  Created by Virgilio De la Cruz Jardón on 14/03/22.
//

import SwiftUI

struct DetallePelicula: View {
    
    let pelicula: Pelicula
    @State private var nombrePelicula: String = ""
    @State private var duracion: String = ""
    let coreDM: CoreDataManager
    @Binding var necesitaRefresh: Bool
    
    var body: some View {
        VStack {
            Text("Nombre:")
                .multilineTextAlignment(.leading)
            TextField(pelicula.titulo ?? "", text: $nombrePelicula)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Duracion")
            TextField(pelicula.duracion ?? "", text: $duracion)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Actualiza") {
                if !nombrePelicula.isEmpty {
                    pelicula.titulo = nombrePelicula
                    pelicula.duracion = duracion
                    coreDM.updateMovie()
                    necesitaRefresh.toggle()
                }// fin if
            }// fin Button
        } // fin Vstack
    }// fin view
}

struct DetallePelicula_Previews: PreviewProvider {
    static var previews: some View {
        let pelicula = Pelicula()
        let coreDM = CoreDataManager()
        DetallePelicula(pelicula: pelicula, coreDM: CoreDataManager(), necesitaRefresh: .constant(false))
    }
    
}
