//
//  ContentView.swift
//  navegacion
//
//  Created by alumno on 09/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{ //Indico que voy a usar navegacion
            VStack{
                NavigationLink(
                    destination: NuevaVista(),
                    label: {
                        Text("Nueva Pantalla")
                    }
                )
                NavigationLink(
                    destination: Text("Hoola"),
                    label: {
                        Text("Dame Clic")
                    }
                )
                NavigationLink(
                    destination: Text("A volar...."),
                    label: {
                        Image(systemName: "paperplane")
                    }
                )
                NavigationLink(
                    destination: Text("Demo"),
                    label: {
                        VStack{
                            Text("Titulo")
                                .foregroundColor(.purple)
                            Text("Subtitulo")
                                .foregroundColor(.green)
                        }
                        .border(Color.red, width:2)
                    }
                )
            }//VStack
            .navigationTitle("Titulo")
            .navigationBarTitleDisplayMode(.inline)
            
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
