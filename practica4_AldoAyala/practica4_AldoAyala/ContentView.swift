//
//  ContentView.swift
//  practica4_AldoAyala
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var characters = [Personaje]()
     func llenadatos () async
    {
        
          do
          {
              
              let mycharacters = try await leeJSONWeb(cantidad: 9)
              self.characters = mycharacters
               
          }
            catch {
                    print("Request failed with error:")
                }
        
       
    }
    
    func leeJSONWeb(cantidad: Int) async throws-> [Personaje] {
        var an = [Personaje]()
        var a = Personaje(id: -1, name: "", status: "", species: "", type: "", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")
        an.append(a)
        var urlconsumo: String = "https://rickandmortyapi.com/api/character/"
        
        for i in stride(from: 1, to: cantidad+1, by: 1){
            if(i==1){
                urlconsumo+="\(i)"
            }else{
                urlconsumo+=",\(i)"
            }
            
        }
        print (urlconsumo)
        guard let url = URL(string: urlconsumo) else {
            print("error")
            return an
        }
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            let conv =  try JSONDecoder().decode([Personaje].self, from: data)
            return conv
        }
        catch
        {
            print("el error fue \(error)")
        }
        
        return an
    }


    var body: some View {
        
        NavigationView{
            
            List(self.characters)
            {
                g in NavigationLink(destination: VistaDetallePersonaje(character: g)){
                    ElementListaPersonaje(character: g)
                }
            }
            .task{
                await llenadatos()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
