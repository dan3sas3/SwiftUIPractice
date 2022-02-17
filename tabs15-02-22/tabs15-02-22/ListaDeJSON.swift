//
//  ListaDeJSON.swift
//  tabs15-02-22
//
//  Created by alumno on 15/02/22.
//

import SwiftUI

struct ListaDeJSON: View {
    
    func leerJSON() -> [Gato]{
        let url = Bundle.main.url(forResource:"gatito", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let gatos = try? decoder.decode([Gato].self, from:data)
        return gatos!
    }
    
    var body: some View {
        let listaGatos = leerJSON()
        NavigationView{
           List(listaGatos){
            g in
               NavigationLink(destination:VistaDetalle(gato:g)){
                   ElementoListaGato(gato:g)
               }
                
            }

        }
    }
}

struct ListaDeJSON_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeJSON()
    }
}
