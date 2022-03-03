//
//  VistaModelo.swift
//  crud_api_feb_2022
//
//  Created by Virgilio De la Cruz Jardón on 19/02/22.
//

import Foundation

class ViewModel : ObservableObject
{
    @Published var frutas = [DataFruit]()
    @Published var regreso = DataModel(error: true, message: "", data: [DataFruit(clave_fruits: 0, nombre_fruits: "0", tipo_fruits: "0")])
    let prefixUrl = "https://desastre-crud-fruits-pg.glitch.me"
    init()
    {
        getFruits()
    }
    //MARK: - obtieneFrutas
    func getFruitsasync() async
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarfruits") else
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
                        self.frutas = result.data
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
    //MARK: - obtieneFrutas
    func getFruits()
    {
        guard let url = URL(string: "\(prefixUrl)/mostrarfruits") else
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
                        self.frutas = result.data
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
    //MARK: - creaFrutas
    func creaFruits(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "\(prefixUrl)/insertarfruits") else
        {
            print("error url")
            return
            
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request)
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
                    print("la data es \(result)")
                    DispatchQueue.main.async {
                        print("la data es \(result)")
                        self.regreso = result
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }
                
            }//fin del do
            catch let JsonError
            {
                print("error en json creaFruits", JsonError.localizedDescription)
             }
                
                
        }.resume() // fin dataTask

    } //fin de creaFruits
    //MARK: - actualizaFrutas
    func actualizaFruits(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "\(prefixUrl)/actualizarfruits") else
        {
            print("error url")
            return
            
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request)
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
                        self.frutas = result.data
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

    } //fin de creaFruits
    //MARK: - borraFrutas
    func borraFruits(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "\(prefixUrl)/borrarfruits") else
        {
            print("error url")
            return
            
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request)
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
                        self.frutas = result.data
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

    } //fin de creaFruits
}
