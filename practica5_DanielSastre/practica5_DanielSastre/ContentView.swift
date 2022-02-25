//
//  ContentView.swift
//  practica5_DanielSastre
//
//  Created by alumno on 25/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var razas: [String] = []
    @State private var ordenSeleccion = 0
    @State private var imageLink = ""
    func cargaRazas(){
        Task{
            do{
                var razas = [String]()
                let w = APICall()
                let q = try await w.getRazas()
                let s = q.message
                for r in s{
                    print("\(r.key)")
                    razas.append(r.key)
                }
                self.razas = razas
            }catch{
                print("error")
            }
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Selecciona una raza de perro")
                    .font(.system(size: 15))
                Picker(selection: $ordenSeleccion, label: Text("")){
                    ForEach(0..<razas.count, id:\.self){
                        Text(self.razas[$0])
                            .font(.system(size:15))
                    }
                }
            }
            Button{
                Task{
                    do{
                        let t = APICall()
                        let f = try await t.getImage(raza:self.razas[self.ordenSeleccion])
                        self.imageLink = f.message
                        print("Image Link: \(self.imageLink)")
                    }catch{
                        print("Error")
                    }
                }
            }label:{
                Text("Dame Imagen")
            }
            AsyncImage(url: URL(string:self.imageLink))
        }.onAppear(perform: cargaRazas)//VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
