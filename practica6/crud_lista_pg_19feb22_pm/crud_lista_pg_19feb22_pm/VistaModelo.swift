//
//  VistaModelo.swift
//  crud_api_feb_2022
//
//  Created by Virgilio De la Cruz Jardón on 19/02/22.
//

import Foundation

class ViewModel : ObservableObject
{
    @Published var platillos = [Platillo]()
    @Published var regreso = DataModel(error: true, message: "", data: [Platillo(id_platillo: 0, nombre: "", descripcion: "", precio:"", foto:"")])
    let prefixUrl = "https://restaurant-api-dsastre.glitch.me/"
    init()
    {
        getMenu()
    }

    //MARK: - obtieneFrutas
    func getMenu()
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarmenu") else
        {
            print("error url")
            return
            
        }
        URLSession.shared.dataTask(with: url)
        { (data,res,error) in
            
            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }
            
            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.platillos = result.data
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }
                
            }//fin del do
            catch let JsonError
            {
                print("error en json ", JsonError.localizedDescription)
             }
                
                
        }.resume() // fin dataTask
    }// fin de getFrutas
}
