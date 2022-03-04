

import SwiftUI

struct PlatilloView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
    @State var nombre = ""
    @State var descripcion   = ""
    @State var precio = ""
    @State var foto = ""
    @State var clave = -1
    
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
                    Text(descripcion)
                        .font(Font.system(size: 14, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(precio)
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

struct PlatilloView_Previews: PreviewProvider {
    static var previews: some View {
        PlatilloView()
    }
}
