//
//  practica_midtermApp.swift
//  practica-midterm
//
//  Created by alumno on 11/03/22.
//

import SwiftUI

@main
struct practica_midtermApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
