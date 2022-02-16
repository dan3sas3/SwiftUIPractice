//
//  ListaSimple.swift
//  tabs15-02-22
//
//  Created by alumno on 15/02/22.
//

import SwiftUI

struct ListaSimple: View{
    var body: some View{
        NavigationView{
            List{
                Text("1")
                Text("2")
                Text("3")
            }
            .navigationTitle("Lista")
        }
    }
}


struct ListaSimple_Previews: PreviewProvider {
    static var previews: some View {
        ListaSimple()
    }
}
