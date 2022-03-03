
//https://www.youtube.com/watch?v=vw9xY18gpuE
//https://www.youtube.com/watch?v=vw9xY18gpuE minuto 21:32 para permisos extras
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mivistamodelo : ViewModel
   // mivistamodelo.getFruits()
    var body: some View {
        
        NavigationView
        {
            
            List
            {
                ForEach(mivistamodelo.frutas, id: \.clave_fruits)
                { item in
                    NavigationLink(
                        destination: EditaFrutaView(nombrefruta: item.nombre_fruits,
                                                    tipofruta: item.tipo_fruits,
                                                    clavefruta: item.clave_fruits),
                        label:{
                            VStack{
                                Text(item.nombre_fruits)
                            }// fin vstack
                            
                        }// fin label
                    )
                        
                }
                .onDelete(perform: borrarFruta)
            }
         
            .listStyle(InsetListStyle())
            
            .navigationBarTitle("Lista de frutas")
            .navigationBarItems(leading: BotonRefresh, trailing: BotonMas)
            .onAppear {
                            //print("ContentView appeared!")
                mivistamodelo.getFruits()
                        }
        }
 }
    private func borrarFruta(indexSet: IndexSet)
    {
        let clave = indexSet.map{mivistamodelo.frutas[$0].clave_fruits}
        
        DispatchQueue.main.async{
            var params : [String:Any]  = ["clave_fruits": clave[0]]
            self.mivistamodelo.borraFruits(parameters: params)
            self.mivistamodelo.getFruits()
        }
    }
    var BotonMas: some View {
        NavigationLink(
            destination: NuevaFrutaView(),

               label:{
            Image(systemName: "plus")
        })
    }
    var BotonRefresh: some View {
        Button("Actualiza")
        {
            mivistamodelo.getFruits()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
