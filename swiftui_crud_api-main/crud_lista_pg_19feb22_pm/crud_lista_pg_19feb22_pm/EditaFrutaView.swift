

import SwiftUI

struct EditaFrutaView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
    @State var nombrefruta = ""
    @State var tipofruta   = ""
    @State var saborFruta = ""
    @State var clavefruta   = -1
    
    @Environment(\.dismiss) var regresa
    var body: some View {
        //NavigationView{
           // ZStack{
           //     Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading)
                {
                    Text("Edita Fruta")
                        .font(Font.system(size: 16, weight: .bold))
                    TextField("Nombre", text: $nombrefruta)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(3)
                       
                    TextField("Tipo", text: $tipofruta)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(3)
                    
                    TextField("Sabor", text: $saborFruta)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(3)
                        
                    Spacer()
                    
                    
                }.padding()// fin VStack
                
           // }// fin ZStack
            .navigationBarTitle("Edita Fruta", displayMode: .inline)
            .navigationBarItems( trailing: BotonActualizar)
      //  }// fin NavigationView
    }
    var BotonActualizar: some View {
        Button(action: {
            let params : [String:Any]  = [
                "nombre_fruits":  self.nombrefruta , "tipo_fruits": self.tipofruta,
                "clave_fruits": self.clavefruta, "sabor":self.saborFruta
            ]
            print("los parametros son \(params)")
            mivistamodelo.actualizaFruits (parameters: params)
            mivistamodelo.getFruits()
            regresa()
                },
               label:{
            Text("Actualiza")
        })
    }
}

struct EditaFrutaView_Previews: PreviewProvider {
    static var previews: some View {
        EditaFrutaView()
    }
}
