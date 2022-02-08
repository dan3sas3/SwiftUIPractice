//
//  ContentView.swift
//  swiftUI_pantallas
//
//  Created by alumno on 08/02/22.
//

//
//  ContentView.swift
//  vistas_2feb22
//
//  Created by Virgilio De la Cruz Jardón on 02/02/22.
//

import SwiftUI

struct ContentView: View {
    //Variable de entorno para saber si esta vertival
    @Environment(\.verticalSizeClass) var claseVertical
    var body: some View {
        VStack {//vstack2
            VStack{//vstack 1
                Text("Busca ayuda")
                    .fontWeight(.medium)
                    .font(.system(size: 40))
                    .foregroundColor(.indigo)
                Text("Te ayudamos con tus tareas")
            }// fin vstack 1
            HStack
            {
            Image("user1")
                .resizable()
                .scaledToFit()
            Image("user2")
                .resizable()
                .scaledToFit()
            Image("user3")
                .resizable()
                .scaledToFit()
                
            }
            .padding(.horizontal,20)
            Text("Tenemos los mejores expertos")
            Spacer()
            if claseVertical == .compact{ //si se cumple esta condicion, el dispositivo esta en vertical
                BotonesInicioHorizontal()
            }else{
                BotonesInicioVertical()
            }
            
            
            
        }// fin vstack 2
        .padding(.top, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
            .previewDisplayName("iPhone 12 Pro")
    }
}



struct BotonesInicioHorizontal: View{
    var body: some View {
        HStack
        {
            Button
            {
            }
        label:{
            Text("Registrate")
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(10)
            Button
            {
            }
        label:{
            Text("Login")
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(10)
            
            
        }
    }
}




struct BotonesInicioVertical: View {
    var body: some View {
        VStack
        {
            Button
            {
            }
        label:{
            Text("Registrate")
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(10)
            Button
            {
            }
        label:{
            Text("Login")
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(Color.red)
        .cornerRadius(10)
            
            
        }
    }
}
