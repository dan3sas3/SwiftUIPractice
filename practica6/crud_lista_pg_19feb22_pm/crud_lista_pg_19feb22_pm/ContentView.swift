import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
   // mivistamodelo.getMenu()
    var body: some View {
        
        NavigationView
        {
            
            List
            {
                ForEach(mivistamodelo.platillos, id: \.id_platillo)
                { item in
                    NavigationLink(
                        destination: PlatilloView(nombre: item.nombre,
                                                  descripcion: item.descripcion,
                                                  precio: item.precio,
                                                  foto: item.foto),
                        label:{
                            VStack{
                                Text(item.nombre)
                            }// fin vstack
                            
                        }// fin label
                    )
                        
                }
            }
            .listStyle(InsetListStyle())
            
            .navigationBarTitle("Menu")
            //.navigationBarItems(leading: BotonRefresh, trailing: BotonMas)
            .onAppear {
                mivistamodelo.getMenu()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
