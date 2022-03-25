import SwiftUI

struct PlaceAnnotationView: View {
  let title: String
  
  var body: some View {
    VStack(spacing: 0) {
      Text(title)
        .font(.callout)
        .padding(5)
        .background(Color(uiColor: .white))
        .cornerRadius(10)
        .foregroundColor(Color(uiColor: .black))
      
      Image(systemName: "mappin.circle.fill")
        .font(.title)
        .foregroundColor(.red)
      
      Image(systemName: "arrowtriangle.down.fill")
        .font(.caption)
        .foregroundColor(.red)
        .offset(x: 0, y: -5)
    }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceAnnotationView(title: "Empire State Building")
      .background(Color.gray)
  }
}
