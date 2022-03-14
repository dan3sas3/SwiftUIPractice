//
//  ContentView.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            VStack{
                Text("Acerca").bold().font(.system(size: 38))
                Text("Popeyes es una cadena de restaurantes de comida rápida especializada en pollo frito fundada en 1972 en Nueva Orleans, Luisiana.​ Desde 2008 su nombre completo es Popeyes Louisiana Kitchen, Inc. Anteriormente se denominó Popeyes Chicken & Biscuits y Popeyes Famous Fried Chicken & Biscuits.")
                        .multilineTextAlignment(.center)
                Image("Image-1")
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .scaledToFit()
            }
                .tabItem{
                    Image(systemName:"questionmark")
                    Text("Inicio")
                }//tabItem
            ListaSucursales()
                .tabItem{
                    Image(systemName: "house")
                    Text("Sucursales")
                }//tabItem
            EnviarPost()
                .tabItem{
                    Image(systemName:"arrow.forward")
                    Text("POST")
                }//tabItem
            
        }//TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
