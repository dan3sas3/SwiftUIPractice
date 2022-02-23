//
//  ContentView.swift
//  exchange-api
//
//  Created by alumno on 22/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var num:String = ""
    @State private var res:String = ""
    @State private var monedas = ["MXN", "USD"]
    @State private var ordenSeleccionDe = 0
    @State private var ordenSeleccionA = 0
    @State private var resMoneda = 0
    
    var body: some View {
        VStack{
            HStack{
                Text("De")
                    .font(.system(size:15))
                Picker(selection: $ordenSeleccionDe, label: Text("")){
                    ForEach(0..<monedas.count, id:\.self){
                        Text(self.monedas[$0])
                            .font(.system(size:15))
                    }
                }//Picker
            }//HStack
            HStack{
                Text("A")
                    .font(.system(size:15))
                Picker(selection: $ordenSeleccionA, label: Text("")){
                    ForEach(0..<monedas.count, id:\.self){
                        Text(self.monedas[$0])
                            .font(.system(size:15))
                    }
                }//Picker
            }//HStack
            TextField("Escribe cantidad", text:$num)
            Text(res)
            Button{
                Task{
                    do{
                        let t = APICall()
                        let f = try await t.getCurrency(de: "USD", a: "MXN", monto: 30)
                        print("Resultado=\(f.result)")
                    }catch{
                        print("Error")
                    }
                }
            }label: {
                Text("Convertir")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
