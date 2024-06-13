//
//  rickMortyApp.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 06/06/24.
//

import SwiftUI

@main

struct RickAndMortyApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppRouter()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
        }
    }
}
