//
//  ContentView.swift
//  16-feb-22-api
//
//  Created by alumno on 16/02/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var animales = [Animal]()
     func llenadatos () async
    {
        
          do
          {
              
              let myanimales = try await leeJSONWeb(cantidad: 10)
              self.animales = myanimales
               
          }
            catch {
                    print("Request failed with error:")
                }
        
       
    }
    
    func leeJSONWeb(cantidad: Int) async throws-> [Animal] {
        var an = [Animal]()
        var a = Animal(name: "", latin_name: "", animal_type: "", active_time: "", length_min: "", length_max: "", weight_min: "", weight_max: "", lifespan: "", habitat: "", diet: "", geo_range: "", image_link: "", id: -1)
        an.append(a)
        var urlconsumo: String = "https://zoo-animal-api.herokuapp.com/animals/rand/"+String(cantidad)
        print (urlconsumo)
        guard let url = URL(string: urlconsumo) else {
            print("error")
            return an
        }
        do
        {
            let (data, _) = try await URLSession.shared.data(from: url)
            let conv =  try JSONDecoder().decode([Animal].self, from: data)
            return conv
        }
        catch
        {
            print("el error fue \(error)")
        }
        
        return an
    }


    var body: some View {
            List(self.animales)
            {
                ani in ElementoListaAnimal(animal: ani)
            }
            .task{
                await llenadatos()
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
 }

