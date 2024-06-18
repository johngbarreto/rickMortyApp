//
//  CharacterListView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//
import SwiftUI


struct CharacterListView: View {
    @ObservedObject var presenter: CharacterPresenter
    
    var body: some View {
        
        CustomNavView(presenter: presenter) {
            ZStack {
                // Background Image
                Image("bgImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.5))
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(presenter.characters) { character in
                            CustomNavLink(
                                presenter: presenter,
                                destination:
                                    CharacterDetailView(
                                        presenter:
                                            CharacterDetailPresenter(
                                                character: character,
                                                interactor: presenter.interactor
                                            )
                                    ).customNavigationStarBtnHidden(true)
                            ) {
                                CharacterCardView(
                                    character: character,
                                    isFavorite: presenter.checkFavorite(character: character),
                                    onToggleFavorite: {
                                        presenter.toggleFavorite(character: character)
                                    }
                                )
                            }
                            .customNavigationBackBarBtnHidden(true)
                        }
                    }
                    .background(Color.clear)
                    .padding()
                }
            }
        }

    }
}
