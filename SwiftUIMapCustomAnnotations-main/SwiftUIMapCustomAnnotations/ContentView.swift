import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var desc: String
  var imageURL: String
  var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.432608, longitude: -99.133209), span: MKCoordinateSpan(latitudeDelta: 0.0005, longitudeDelta: 0.25))
  
    var places = [Place(name: "Ángel de la Independencia", desc:"El Monumento a la Independencia, más conocido como el Ángel de la Independencia es el monumento más emblemático del país.", imageURL: "https://media.admagazine.com/photos/618a6b295b87a99cfb816608/master/w_3000,h_2122,c_limit/61921.jpg", coordinate: CLLocationCoordinate2D(latitude: 19.4269903, longitude: -99.1676463)),
                  Place(name: "Monumento a la Revolución", desc:"El Monumento a la Revolución es una obra arquitectónica y un mausoleo dedicado a la conmemoración de la Revolución mexicana.", imageURL: "https://d3ipks40p8ekbx.cloudfront.net/dam/jcr:1b494f72-41c6-4bd6-acf2-eb8526412d46/12_490x373-Monumento-a-la-Revolucion-min.jpg", coordinate: CLLocationCoordinate2D(latitude: 19.436233, longitude: -99.154701)),
                  Place(name: "Bellas Artes", desc: "Primer museo de arte en México inaugurado el 29 de noviembre de 1934 con el nombre de Museo de Artes Plásticas.", imageURL: "https://br.bimsareports.com/wp-content/uploads/2020/09/Bellas-Artes.jpg", coordinate: CLLocationCoordinate2D(latitude: 19.435156, longitude: -99.140907)),
                  Place(name: "Zócalo", desc: "El Zócalo está rodeado por la Catedral Metropolitana de la Ciudad de México, el Palacio Nacional, el Antiguo Palacio del Ayuntamiento y el Edificio de Gobierno.", imageURL: "https://mediaim.expedia.com/destination/7/539a68b3af1cab5204b91ece87fe8a87.jpg?impolicy=fcrop&w=536&h=384&q=high", coordinate: CLLocationCoordinate2D(latitude: 19.432777, longitude: -99.133217)),
                  Place(name: "Museo de Antropología", desc:"El Museo Nacional de Antropología (MNA) es uno de los recintos museográficos más importantes de México y de América.", imageURL: "https://www.mexicodesconocido.com.mx/wp-content/uploads/2021/03/Captura-de-Pantalla-2021-03-10-a-las-14.32.24.png", coordinate: CLLocationCoordinate2D(latitude: 19.42610885, longitude: -99.186629))]
  var body: some View {
    NavigationView {
      Map(coordinateRegion: $region, annotationItems:places) { place in
        MapAnnotation(coordinate: place.coordinate) {
          NavigationLink {
            LocationDetailsView(place: place)
          } label: {
            PlaceAnnotationView(title: place.name)
          }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle("Lugares turísticos de la CDMX")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
