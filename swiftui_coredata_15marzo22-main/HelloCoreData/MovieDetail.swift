//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by Virgilio De la Cruz on 2/14/21.
//

import SwiftUI

struct MovieDetail: View {
    
    let movie: Movie
    @State private var movieName: String = ""
    let coreDM: CoreDataManager
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Actualiza") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updatePelicula()
                    needsRefresh.toggle()
                }
            }//fin Button
        }//fin Vstack
        
    }//fin View
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let movie = Movie()
        let coreDM = CoreDataManager()
        
        MovieDetail(movie: movie, coreDM: CoreDataManager(), needsRefresh: .constant(false))
    }
}
