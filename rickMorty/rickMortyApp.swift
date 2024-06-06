//
//  rickMortyApp.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 06/06/24.
//

import SwiftUI

@main
struct rickMortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
