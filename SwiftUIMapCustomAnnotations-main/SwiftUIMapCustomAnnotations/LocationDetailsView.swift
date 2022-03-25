import SwiftUI
import MapKit

struct LocationDetailsView: View {
  let place: Place
  
  var body: some View {
    VStack(spacing: 20) {
      Text(place.name)
        .font(.title)
      
      Text(place.desc)
        .font(.title2)
        
      AsyncImage(
            url:URL(string:place.imageURL),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:350, maxHeight:350)
            },
            placeholder: {
                ProgressView()
            }
      )
    }
    .navigationTitle(place.name)
  }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
  public var description: String {
    "\(latitude);\(longitude)"
  }
}

struct LocationDetailsView_Previews: PreviewProvider {
  static var previews: some View {
      LocationDetailsView(place: Place(name: "Empire State Building", desc:"", imageURL:"", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)))
  }
}
