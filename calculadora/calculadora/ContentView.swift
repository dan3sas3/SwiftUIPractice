//
//  ContentView.swift
//  calculadora
//
//  Created by alumno on 08/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var num1: String = ""
    @State private var num2: String = ""
    @State private var res: String = "Aqui se mostrara el resultado"
    
    var body: some View {
        VStack{ //VStack 1
            Text("Mi Calculadora")
                .fontWeight(.medium)
                .font(.system(size:30))
            HStack{//HStack 1
                Text("Num. 1:")
                    .font(.system(size:15))
                TextField("Escribe el 1er num.", text:$num1)
                    .font(.system(size:15))
                    .keyboardType(.decimalPad)
            }//HStack 1
            HStack{ //HStack 2
                Text("Num. 2:")
                    .font(.system(size:15))
                TextField("Escribe el 2do num.", text:$num2)
                    .font(.system(size:15))
                    .keyboardType(.decimalPad)
            } //HStack2
            Text(res)
            Spacer()
            //botones
            VStack{//VStack 2
                Button{ //Boton Suma
                    self.res = suma(x:self.num1, y:self.num2)
                }
                label:{
                    Text("+")
                        .frame(width: 100)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                } //Boton suma (label)
                Button{ //Boton resta
                    self.res = resta(x:self.num1, y:self.num2)
                }
                label:{
                    Text("-")
                        .frame(width: 100)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                } //Boton resta (label)
                Button{ //Boton Limpiar
                    self.num1 = ""
                    self.num2 = ""
                    self.res = "Aqui se mostrara el resultado"
                }
                label:{
                    Text("Limpiar")
                        .frame(width: 100)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                } //Boton Limpiar (label

            }//VStack 2
        }//VStack 1
        
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

