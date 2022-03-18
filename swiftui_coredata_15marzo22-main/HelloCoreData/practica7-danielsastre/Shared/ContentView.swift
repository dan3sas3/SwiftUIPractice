//
//  ContentView.swift
//  Shared
//
//  Created by alumno on 17/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            VistaAlumnos(coreDM: CoreDataManager())
                .tabItem{
                    Text("Alumnos")
                }
            VistaProfesores(coreDM: CoreDataManager())
                .tabItem{
                    Text("Profesores")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
