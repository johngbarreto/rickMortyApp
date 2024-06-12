//
//  CharacterCardView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 09/06/24.
//


import SwiftUI

struct CharacterCardView: View {
    let character: Character
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 93)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(height: 93)
            }
            
            HStack(alignment: .top) {
                Button(action: onToggleFavorite) {
                    Image(isFavorite ? "favorited" : "favorite")

                }
                .padding(.leading, 12)
                
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.system(size: 14))
                        .foregroundColor(.green)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .minimumScaleFactor(0.9)
                    Text(character.species)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .minimumScaleFactor(0.9)
                    Spacer()
                }
                Spacer() 
            }
        }
        .background(Color.customBlackBg)
        .cornerRadius(15)
        .shadow(color: .green, radius: 8, x: 0, y: 0)
        .frame(width: 147)
    }
}


