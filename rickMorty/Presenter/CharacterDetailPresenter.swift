//
//  CharacterDetailPresenter.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 08/06/24.
//

import Foundation
import Combine

protocol CharacterDetailPresenterProtocol: ObservableObject {
    var character: Character { get }
    var isFavorite: Bool { get }
    func toggleFavorite()
}

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    let interactor: CharacterInteractorProtocol
    @Published var character: Character
    @Published var isFavorite: Bool
    
    private var cancellables = Set<AnyCancellable>()
    
    init(character: Character, interactor: CharacterInteractorProtocol) {
        self.character = character
        self.interactor = interactor
        self.isFavorite = false
        checkFavoriteStatus()
    }
    
    private func checkFavoriteStatus() {
        interactor.fetchFavoritedCharacters()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] favoritedCharacters in
                self?.isFavorite = favoritedCharacters.contains { $0.id == Int32(self?.character.id ?? 0) }
            }
            .store(in: &cancellables)
    }
    
    func formattedDate(from dateString: String) -> String {
        let date = dateString.dateFromString(dateString)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }

    func toggleFavorite() {
        if isFavorite {
            interactor.unfavoriteCharacter(character)
        } else {
            interactor.favoriteCharacter(character)
        }
        checkFavoriteStatus()
        isFavorite.toggle()
    }
}
