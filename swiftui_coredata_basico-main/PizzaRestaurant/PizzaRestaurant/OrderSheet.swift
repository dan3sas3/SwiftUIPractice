//
//  OrderSheet.swift
//  PizzaRestaurant
//
//  Mañana
//

import SwiftUI

struct OrderSheet: View {
       
    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Detalles Pizza")) {
                    Picker(selection: $selectedPizzaIndex, label: Text("Tipo de Pizza")) {
                        ForEach(0 ..< pizzaTypes.count) {
                                Text(self.pizzaTypes[$0]).tag($0)
                        }
                    }
                    
                    Stepper("\(numberOfSlices) Rebanadass", value: $numberOfSlices, in: 1...12)
                }
                
                Section(header: Text("Mesa")) {
                    TextField("Numero de mesa", text: $tableNumber)
                        .keyboardType(.numberPad)
                    
                }
                
                Button(action: {
                    guard self.tableNumber != "" else {return}
                    let newOrder = Order(context: viewContext)
                    newOrder.pizzaType = self.pizzaTypes[self.selectedPizzaIndex]
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = self.tableNumber
                    newOrder.numberOfSlices = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    do {
                        try viewContext.save()
                        print("Orden guardada.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Agregar orden")
                }
            }
                .navigationTitle("Agregar orden")
        }
    }
}

struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet()
    }
}
