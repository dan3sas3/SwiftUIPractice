//
//  SucursalView.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//
import SwiftUI

struct SucursalView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
    @State var nombre = ""
    @State var direccion = ""
    @State var foto = ""
    
    @Environment(\.dismiss) var regresa
    var body: some View {
        //NavigationView{
           // ZStack{
           //     Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading)
                {
                    Text(nombre)
                        .font(Font.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(direccion)
                        .font(Font.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    AsyncImage(
                        url: URL(string: foto),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth:.infinity, maxHeight:200)
                        },
                        placeholder:{
                            ProgressView()
                        }
                    )
                    Spacer()

                    
                    
                }.padding()// fin VStack
                
           // }// fin ZStack
            //.navigationBarTitle("Edita Fruta", displayMode: .inline)
            //.navigationBarItems( trailing: BotonActualizar)
      //  }// fin NavigationView
    }
}

struct SucursalView_Previews: PreviewProvider {
    static var previews: some View {
        SucursalView()
    }
}
