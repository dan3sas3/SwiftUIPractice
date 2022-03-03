
import SwiftUI

struct NuevaFrutaView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
    @State var nombrefruta = ""
    @State var tipofruta   = ""
    @State var saborFruta = ""
    @Environment(\.dismiss) var regresa
    var body: some View {
        //NavigationView{
           // ZStack{
           //     Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading)
                {
                    Text("Agrega nueva Fruta")
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
            .navigationBarTitle("Nueva Fruta", displayMode: .inline)
            .navigationBarItems( trailing: BotonGuardar)
      //  }// fin NavigationView
    }
    var BotonGuardar: some View {
        Button(action: {
            var params : [String:Any]  = ["nombre_fruits":  self.nombrefruta, "tipo_fruits": self.tipofruta, "sabor":self.saborFruta]
            print("los parametros son \(params)")
            mivistamodelo.creaFruits(parameters: params)
            mivistamodelo.getFruits()
            
            regresa()
                },
               label:{
            Text("Guardar")
        })
    }
 
}

