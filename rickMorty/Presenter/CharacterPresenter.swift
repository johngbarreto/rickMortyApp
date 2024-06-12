//
//  CharacterPresenter.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 08/06/24.
//

import Foundation
import CoreData
import Combine

protocol CharacterPresenterProtocol: ObservableObject {
    var characters: [Character] { get set }
    var favoritedCharacters: [CharacterEntity] { get set }
    func loadCharacters()
    func toggleFavorite(character: Character)
    func loadFavoritedCharacters()
    func checkFavorite(character: Character) -> Bool
    func showCharacterDetail(character: Character)
}

class CharacterPresenter: CharacterPresenterProtocol {
    let interactor: CharacterInteractorProtocol
    private let router: CharacterRouterProtocol
    @Published var characters: [Character] = []
    @Published var favoritedCharacters: [CharacterEntity] = []
    @Published var selectedCharacter: Character? = nil
    @Published var isShowingFavoriteCharacters: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: CharacterInteractorProtocol, router: CharacterRouterProtocol) {
        self.interactor = interactor
        self.router = router
        loadFavoritedCharacters()
        loadCharacters()
    }
    
    func loadCharacters() {
        interactor.fetchCharacters()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] characters in
                self?.characters = characters
                for character in characters {
                    print("Loaded character: \(character.name), Race: \(character.species)")
                }
            }
        .store(in: &cancellables)    }
    
    func toggleFavorite(character: Character) {
        if checkFavorite(character: character) {
            print("Unfavoriting character: \(character.name)")
            interactor.unfavoriteCharacter(character)
        } else {
            print("Favoriting character: \(character.name)")
            interactor.favoriteCharacter(character)
        }
        loadFavoritedCharacters()
        print("Updated favorite characters: \(favoritedCharacters)")
    }
    
    func toggleFavoriteCD(character: CharacterEntity) {
        interactor.unfavoriteCharacterEntity(character)
        loadFavoritedCharacters()
    }
    
    func checkFavorite(character: Character) -> Bool {
        return favoritedCharacters.contains { $0.id == Int32(character.id) }
    }
    
    func loadFavoritedCharacters() {
        interactor.fetchFavoritedCharacters()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] favoritedCharacters in
                self?.favoritedCharacters = favoritedCharacters
            }
            .store(in: &cancellables)
    }
    
    
    func showCharacterDetail(character: Character) {
        selectedCharacter = character
    }
    
    func showFavoriteCharactersView() {
        print("test")
        isShowingFavoriteCharacters = true
    }
}

