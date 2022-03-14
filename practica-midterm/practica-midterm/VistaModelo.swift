//
//  VistaModelo.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//

import Foundation

class ViewModel : ObservableObject
{

    @Published var sucursales = [Sucursal]()
    @Published var regreso = DataModel(error: true, message: "", data: [Sucursal(id_sucursal: 0, nombre_sucursal: "", direccion_sucursal: "", imagen_sucursal: "")])
    let prefixUrl = "https://sucursales-sastre.glitch.me"
    init()
    {
        getMenu()
    }

    func getMenu()
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarsucursales") else
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
                        self.sucursales = result.data
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
    }
    
}
