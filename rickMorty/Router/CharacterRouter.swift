//
//  CharacterRouter.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 09/06/24.
//

import SwiftUI

protocol CharacterRouterProtocol {
    func createCharacterListView() -> AnyView
}

class CharacterRouter: CharacterRouterProtocol {
    func createCharacterListView() -> AnyView {
        let interactor = CharacterInteractor()
        let presenter = CharacterPresenter(interactor: interactor, router: self)
        return AnyView(CharacterListView(presenter: presenter))
    }
    
    func createFavoriteListView() -> AnyView {
        let interactor = CharacterInteractor()
        let presenter = CharacterPresenter(interactor: interactor, router: self)
        return AnyView(FavoriteCharactersView(presenter: presenter))
    }
}
