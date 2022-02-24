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
    @State private var descMonedas = ["Mexican Peso", "U.S. Dollar"]
    @State private var ordenSeleccionDe = 0
    @State private var ordenSeleccionA = 0
    @State private var fecha:String = ""
    @State private var resMoneda:Double = 0
    
    func cargaCurrencies(){
        Task{
            do{
                var cods = [String]()
                var codsDesc = [String]()
                let w = APICall()
                let q = try await w.getCodigos()
                let s = q.symbols
                print(q.symbols)
                for mon in s{
                    print("\(mon.key)")
                    cods.append(mon.key)
                    print("\(mon.value.symbolDescription)")
                    codsDesc.append(mon.value.symbolDescription)
                }
                print("\(cods[5])")
                print("\(codsDesc[5])")
                cods.sort()
                codsDesc.sort()
                self.monedas = cods
                self.descMonedas = codsDesc
            }catch{
                print("error")
            }
        }
    }

    
    var body: some View {
        VStack{
            HStack{
                Text("De")
                    .font(.system(size:15))
                Picker(selection: $ordenSeleccionDe, label: Text("")){
                    ForEach(0..<monedas.count, id:\.self){
                        Text(self.descMonedas[$0])
                            .font(.system(size:15))
                    }
                }//Picker
            }//HStack
            HStack{
                Text("A")
                    .font(.system(size:15))
                Picker(selection: $ordenSeleccionA, label: Text("")){
                    ForEach(0..<monedas.count, id:\.self){
                        Text(self.descMonedas[$0])
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
                        let f=try await t.getCurrency(de:
                            self.monedas[self.ordenSeleccionDe], a:
                                self.monedas[self.ordenSeleccionA], monto:
                                    Double(self.num)!)
                        print ("res=\(f.result)")
                        self.resMoneda = f.result
                        self.fecha = f.date
                        let r = String(format: "%.1f", self.resMoneda)
                        self.res = "El resultado es \(r) en la fecha \(self.fecha)"
                    }catch{
                        print("Error")
                    }
                }
            }label: {
                Text("Convertir")
            }
        }.onAppear(perform: cargaCurrencies) //VStack
    } //body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
