//
//  FavoriteCharacterView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//

import Foundation
import SwiftUI

struct FavoriteCharactersView: View {
    @ObservedObject var presenter: CharacterPresenter

    var body: some View {

        ZStack {
            Image("bgImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            List(presenter.favoritedCharacters) { character in
                FavoriteCharacterRow(character: character, presenter: presenter)
                    .listRowBackground(Color.clear)
                    .background(Color.clear)
                    .padding(.horizontal, -20)
            }
            .listRowBackground(Color.clear)
            .background(Color.clear)
            .scrollContentBackground(.hidden)
            .onAppear {
                UICollectionView.appearance().backgroundColor = .clear
                presenter.loadFavoritedCharacters()
            }
        }
    }
}
