//
//  ContentView.swift
//  practica4-api
//
//  Created by alumno on 17/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var chars = [Character]()
    func llenaDatos () async{
        do{
            let myChars = try await leeJSONWeb(cantidad: 10)
            self.chars = myChars
        } catch {
            print("Request Failed")
        }
    }
    func leeJSONWeb(cantidad:Int) async throws -> [Character]{
        var listaPersonajes = ""
        for index in 1...cantidad{
            listaPersonajes = listaPersonajes + String(index)+","
        }
        listaPersonajes.remove(at: listaPersonajes.index(before:listaPersonajes.endIndex))
        print(listaPersonajes)
        var chars = [Character]()
        let c = Character(id: -1, name: "", status: "", species: "", type: "", gender: "", origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [""], url: "", created: "")
        chars.append(c)
        let urlConsumo: String = "https://rickandmortyapi.com/api/character/" + listaPersonajes
        print(urlConsumo)
        guard let url = URL(string:urlConsumo) else {
            print("error")
            return chars
        }
        do{
            let (data, _) = try await URLSession.shared.data(from:url)
            let conv = try JSONDecoder().decode([Character].self, from:data)
            return conv
        } catch {
            print("Error")
        }
        
        return chars
    }
    var body: some View {
        NavigationView{
            List(self.chars){
                ch in
                NavigationLink(destination:CharacterDetailed(character: ch)){
                    ListElementCharacter(character:ch)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
