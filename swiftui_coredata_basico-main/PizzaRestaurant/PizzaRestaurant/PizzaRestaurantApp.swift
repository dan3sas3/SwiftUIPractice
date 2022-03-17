//
//  PizzaRestaurantApp.swift
//  PizzaRestaurant
//
//  Created by vdelacruz vdelacruz.
//

import SwiftUI

@main
struct PizzaRestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
