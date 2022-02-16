//
//  ContentView.swift
//  tabs15-02-22
//
//  Created by alumno on 15/02/22.
//

import SwiftUI

//sfsymbols.com

struct ContentView: View {
    var body: some View {
        TabView{
            Text("Bienvenido")
                .tabItem{
                    Image(systemName: "phone.fill")
                    Text("Inicio")
                }//tabItem
            ListaSimple()
                .tabItem{
                    Image(systemName: "tv.fill")
                    Text("Television")
                }//tabItem
            ListaDeJSON()
                .tabItem{
                    Image(systemName: "phone.fill")
                    Text("Inicio")
                }//tabItem
        }//TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
