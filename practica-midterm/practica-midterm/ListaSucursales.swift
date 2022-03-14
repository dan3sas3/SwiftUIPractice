//
//  ListaSucursales.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//

import SwiftUI

struct ListaSucursales: View {
    @EnvironmentObject var miVistaModelo: ViewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(miVistaModelo.sucursales, id:\.id_sucursal){
                    item in
                    NavigationLink(
                        destination: SucursalView(
                            nombre:item.nombre_sucursal,
                            direccion:item.direccion_sucursal,
                            foto:item.imagen_sucursal
                        ),
                        label: {
                            VStack{
                                Text(item.nombre_sucursal)
                            }
                        }
                    )
                }
            }
            .navigationBarTitle("Popeyes en CDMX")
            .onAppear{
                miVistaModelo.getMenu()
            }
        }
    }
}

struct ListaSucursales_Previews: PreviewProvider {
    static var previews: some View {
        ListaSucursales()
    }
}
