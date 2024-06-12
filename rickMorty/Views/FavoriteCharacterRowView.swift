//
//  FavoriteCharacterRowView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 12/06/24.
//

import SwiftUI


import SwiftUI

struct FavoriteCharacterRow: View {
    let character: CharacterEntity
    @ObservedObject var presenter: CharacterPresenter

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            // Image with padding and corner radius
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(25) // Make the image circular
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            .padding(.leading, 8) // Add padding to the leading edge of the image

            // VStack for the name and race
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name ?? "")
                    .font(.headline)
                    .foregroundColor(.green)
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(character.race ?? "")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }

            Spacer()

            // Star button with padding
            Button(action: {
                presenter.toggleFavoriteCD(character: character)
            }) {
                Image("favorited")
                    .foregroundColor(.yellow)
            }
            .padding(.trailing, 8) // Add padding to the trailing edge of the button
        }
        .padding()
        .background(Color.customBlackBg)
        .cornerRadius(15)
        .shadow(color: .green, radius: 8, x: 0, y: 0)
        .frame(maxWidth: .infinity) // Make the row take the full available width
        .padding(.horizontal) // Add horizontal padding to the entire row
        .padding(.vertical, 5) // Add vertical padding to the entire row
    }
}


//struct FavoriteCharacterRow: View {
//    let character: CharacterEntity
//    @ObservedObject var presenter: CharacterPresenter
//
//
//    var body: some View {
//        HStack(alignment: .center, spacing: 16) {
//            AsyncImage(url: URL(string: character.image ?? "")) { image in
//                image.resizable()
//                    .scaledToFill()
//                    .frame(width: 60, height: 60)
//                    .clipped()
//                    .cornerRadius(30)
//            } placeholder: {
//                ProgressView()
//                    .frame(width: 60, height: 60)
//            }
//            .padding(6)
//
//            VStack(alignment: .leading, spacing: 4) {
//                Text(character.name ?? "")
//                    .font(.headline)
//                    .foregroundColor(.green)
//                    .lineLimit(1)
//                    .truncationMode(.tail)
//
//                Text(character.race ?? "")
//                    .font(.subheadline)
//                    .foregroundColor(.green)
//                    .lineLimit(1)
//                    .truncationMode(.tail)
//            }
//
//            Spacer()
//
//            Button(action: {
//                presenter.toggleFavoriteCD(character: character)
//            }) {
//                Image(systemName: "star.fill")
//                    .foregroundColor(.yellow)
//            }
//            .padding(.trailing, 10)
//        }
//        .background(Color.black)
//        .cornerRadius(15)
//        .shadow(color: .green, radius: 8, x: 0, y: 0)
//        .padding()
//    }
//}
