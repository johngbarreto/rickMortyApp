//
//  ContentView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var presenter: CharacterPresenter

    init() {
        let router = CharacterRouter()
        let interactor = CharacterInteractor()
        self.presenter = CharacterPresenter(interactor: interactor, router: router)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(presenter.characters) { character in
                        CharacterCardView(
                            character: character,
                            isFavorite: presenter.checkFavorite(character: character),
                            onToggleFavorite: {
                                presenter.toggleFavorite(character: character)
                            }
                        )
                        .onTapGesture {
                            // Navigate to character detail view
                            presenter.showCharacterDetail(character: character)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Characters")
            .onAppear {
                presenter.loadCharacters()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
