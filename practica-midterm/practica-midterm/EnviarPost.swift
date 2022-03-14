//
//  EnviarPost.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//

import SwiftUI

struct EnviarPost: View {
    @EnvironmentObject var mivistamodelo : ViewModel
    @State var email = ""
    @State var password = ""
    @State var confirmacion = Response(id:0, token:"")
    @State var confirmError = ResponseError(error:"")
    
    @Environment(\.dismiss) var regresa
    var body: some View {
        NavigationView{
                VStack (alignment: .leading)
                {
                    Text("Ingresa un correo")
                        .font(Font.system(size: 16, weight: .bold))
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(3)
                    Text("Ingresa una contraseña")
                    TextField("Tipo", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(3)
                    Text("Respuesta").bold()
                    if(!confirmacion.token.isEmpty){
                        Text("ID: \(confirmacion.id), Token: \(confirmacion.token) ")
                    }
                    if(!confirmError.error.isEmpty){
                        Text("Error: \(confirmError.error)")
                    }
                }.padding()// fin VStack
            
                
            .navigationBarTitle("Probar POST!", displayMode: .inline)
            .navigationBarItems( trailing: BotonGuardar)
        }
      //  }// fin NavigationView
    }
    var BotonGuardar: some View {
        Button(action: {
            print("los parametros son \(self.email) y \(self.password)")
            enviarDatos(email:self.email, password: self.password)
            regresa()
                },
               label:{
            Text("Guardar")
        })
    }
    func enviarDatos(email:String, password:String) // parametrers es un diccionario
        {
            let parameters = ["email": email, "password":password]
            guard let url = URL(string: "https://reqres.in/api/register") else
            {
                print("error url")
                return
                
            }
            //let data = try! JSONSerialization.data(withJSONObject: jsonData)
            //print(data)
            let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = bodyData
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
                        let result = try JSONDecoder().decode(Response.self, from: d)
                        print("la data es \(result)")
                        DispatchQueue.main.async {
                            print("la data es \(result)")
                            self.confirmacion = result
                            self.confirmError.error = ""
                        } //fin async
                    } // fin data
                    else
                    {
                        print("no hay datos")
                    }
                    
                }//fin del do
                catch
                {
                    do{
                        if let d = data {
                            let resultWithError = try JSONDecoder().decode(ResponseError.self, from:d)
                            print("La data es \(resultWithError)")
                            DispatchQueue.main.async {
                                print("La data \(resultWithError)")
                                self.confirmError = resultWithError
                                self.confirmacion.token = ""
                            }
                        }else{
                            print ("no hay datos");
                        }
                    }catch let JsonError{
                        print("error en json", JsonError.localizedDescription)
                    }
                    //print("error en json", JsonError.localizedDescription)
                 }
                    
                    
            }.resume() // fin dataTask
        }
}

