//
//  Persistence.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 06/06/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "CharacterEntity")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    func clearCoreData() {
        let persistentStoreCoordinator = PersistenceController.shared.container.persistentStoreCoordinator

        guard let storeURL = persistentStoreCoordinator.persistentStores.first?.url else {
            print("Failed to retrieve persistent store URL")
            return
        }

        do {
            try persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
            print("Core Data persistent store cleared successfully")
        } catch {
            print("Failed to clear Core Data persistent store: \(error)")
        }
    }

    func save() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
