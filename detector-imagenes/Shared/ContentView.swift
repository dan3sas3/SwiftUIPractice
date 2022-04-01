//
//  ContentView.swift
//  Shared
//
//  Created by alumno on 31/03/22.
//

import SwiftUI
import CoreML

struct ContentView: View {
    let model = MobileNetV2()
    let photos = ["lemon", "pineapple", "strawberry", "owl", "puppy", "mixed", "pug"]
    @State private var currentIndex: Int = 0
    @State private var classLabel: String = ""
    
    var body: some View {
        VStack{
            Image(photos[currentIndex])
                .resizable()
                .frame(width:200, height:200)
            HStack{
                Button("Atrás"){
                    if self.currentIndex > 0{
                        self.currentIndex = self.currentIndex - 1
                    }else{
                        self.currentIndex = self.photos.count-1
                    }
                }//fin button
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    Button("Adelante"){
                    if self.currentIndex < self.photos.count-1 {
                        self.currentIndex = self.currentIndex + 1
                    }else{
                        self.currentIndex = 0
                    }
                }//fin button
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
            }//Fin HStack
            Button("Clasificar"){
                classifyImage()
            }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.gray)
            Text(classLabel)
                .padding()
            Spacer()
        }//VStack
    }
    private func classifyImage(){
        let currentImageName = photos[currentIndex]
        guard let image = UIImage(named: currentImageName),
              let resizedImage = image.resizeImageTo(size: CGSize(width: 224, height: 224)),
              let buffer = resizedImage.convertToBuffer() else {
                  return
              }
        let output = try? model.prediction(image:buffer)
        if let output = output {
            let results = output.classLabelProbs.sorted{$0.1>$1.1}
            let result = results.map{ (key, value) in
                return "\(key)=\(String(format:"%.2f", value*100))%"
            }.joined(separator: "\n")
            self.classLabel = result
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
