//
//  NuevaVista.swift
//  navegacion
//
//  Created by alumno on 09/02/22.
//

import SwiftUI
struct NuevaVista: View {
    @Environment (\.dismiss) var regresa
    @State private var num1: String = ""
    @State private var num2: String = ""
    var body: some View{
        VStack{
            Text("Soy la nueva vista")
            TextField("Dame dato1", text: $num1)
                .font(.system(size:15))
            TextField("Dame dato2", text: $num2)
                .font(.system(size:15))
        }//VStack
        .toolbar{
            ToolbarItemGroup(placement:.bottomBar){
                NavigationLink(
                    destination:
                        VistaConDatos(dato1:self.num1, dato2:self.num2),
                    label: {
                        Text("Manda datos")
                    }
                )
                Button("Regresa"){
                    regresa()
                }
            }
        }
    }
}
struct NuevaVista_Previews: PreviewProvider {
    static var previews: some View{
        NuevaVista()
    }
}
