//
//  CharacterInteractor.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//

import Foundation
import Combine
import CoreData

protocol CharacterInteractorProtocol {
    func fetchCharacters() -> AnyPublisher<[Character], Never>
    func favoriteCharacter(_ character: Character)
    func unfavoriteCharacter(_ character: Character)
    func fetchFavoritedCharacters() -> AnyPublisher<[CharacterEntity], Never>
    func unfavoriteCharacterEntity(_ characterEntity: CharacterEntity)
}

class CharacterInteractor: CharacterInteractorProtocol {
    private let context = PersistenceController.shared.context
    private let baseURL = URL(string: "https://rickandmortyapi.com/api")!
    
    func fetchCharacters() -> AnyPublisher<[Character], Never> {
        let url = baseURL.appendingPathComponent("character")
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .catch { _ in Just([]) }
            .eraseToAnyPublisher()
    }
    
    func favoriteCharacter(_ character: Character) {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", Int32(character.id))
        
        do {
            let results = try context.fetch(request)
            if results.isEmpty {
                let favorite = CharacterEntity(context: context)
                favorite.id = Int32(character.id)
                favorite.name = character.name
                favorite.image = character.image
                favorite.race = character.species
                saveContext()
            }
        } catch {
            print("Failed to fetch or create character: \(error)")
        }
    }
    
    func unfavoriteCharacter(_ character: Character) {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", Int32(character.id))
        
        do {
            let results = try context.fetch(request)
            for result in results {
                context.delete(result)
            }
            saveContext()
        } catch {
            print("Failed to fetch or delete character: \(error)")
        }
    }
    
    func fetchFavoritedCharacters() -> AnyPublisher<[CharacterEntity], Never> {
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        return Future<[CharacterEntity], Never> { promise in
            let results = (try? self.context.fetch(request)) ?? []
            promise(.success(results))
        }
        .eraseToAnyPublisher()
    }
    
    func unfavoriteCharacterEntity(_ characterEntity: CharacterEntity) {
         let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
         request.predicate = NSPredicate(format: "id == %d", characterEntity.id)

         do {
             let results = try context.fetch(request)
             for result in results {
                 print("Deleting character: \(result.name ?? "") with id: \(result.id)")
                 context.delete(result)
             }
             saveContext()
         } catch {
             print("Failed to fetch or delete character: \(error)")
         }
     }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}

struct CharacterResponse: Codable {
    let results: [Character]
}
