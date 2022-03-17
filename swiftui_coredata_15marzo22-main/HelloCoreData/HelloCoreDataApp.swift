//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Virgilio De la Cruz on 2/14/21.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
