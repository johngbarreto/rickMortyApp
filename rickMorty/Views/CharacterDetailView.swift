//
//  CharacterDetailView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var presenter: CharacterDetailPresenter
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("bgImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    AsyncImage(url: URL(string: presenter.character.image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 4))
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                    .offset(y: 30)
                    .zIndex(1)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: presenter.toggleFavorite) {
                            Image(presenter.isFavorite ? "favorited" : "favorite")
                                .foregroundColor(presenter.isFavorite ? .yellow : .gray)
                        }
                        .offset(y: 15)
                        .padding(.trailing, 20)
                    }
                    
                    VStack {
                        Text(presenter.character.name)
                            .font(.largeTitle)
                            .foregroundColor(.green)
                        
                        Text("Gender: \(presenter.character.gender)")
                            .foregroundColor(.white)
                        Text("Species: \(presenter.character.species)")
                            .foregroundColor(.white)
                        Text("Status: \(presenter.character.gender)")
                            .foregroundColor(.white)
                        Text("Created: \(formattedDate(from: presenter.character.created))")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.clear)
                }
                .zIndex(-1)
                .background(Color.customBlackBg)
                .cornerRadius(15)
            }
            .padding()
        }
    }
    
//    var body: some View {
//        ZStack(alignment: .top) {
//            Image("bgImage")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
//
//
//            VStack {
//                VStack {
//                    AsyncImage(url: URL(string: presenter.character.image)) { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 100, height: 100)
//                    } placeholder: {
//                        ProgressView()
//                            .frame(width: 100, height: 100)
//                    }
//                }
//                .padding(.bottom, -30)
//            }
//
//            VStack {
//                VStack {
//                    HStack {
//                        Spacer()
//                        Button(action: presenter.toggleFavorite) {
//                            Image(presenter.isFavorite ? "favorited" : "favorite")
//                                .foregroundColor(presenter.isFavorite ? .yellow : .gray)
//                        }
//                        .padding(.trailing, 20)
//                    }
//
//                    VStack {
//                        Text(presenter.character.name)
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                        Text(presenter.character.species)
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                        // todo display date formatted
//                        Text("Created: \(formattedDate(from: presenter.character.created))")
//                            .font(.title)
//                            .foregroundColor(.white)
//                    }
//                    .background(Color.blue)
//                }
//                .background(Color.purple)
//            }
//            .background(Color.red)
//            .padding()
//            .padding(.top, 50)
//        }
//    }

    
//    var body: some View {
//        ZStack(alignment: .top) {
//            Image("bgImage")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
//            VStack {
//                VStack() {
//                    AsyncImage(url: URL(string: presenter.character.image)) { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 100, height: 100)
//                    } placeholder: {
//                        ProgressView()
//                            .frame(width: 100, height: 100)
//                    }
//                }.padding(.bottom, -30)
//
//                VStack {
//                    HStack {
//                        Spacer()
//                        Button(action: presenter.toggleFavorite) {
//                            Image(presenter.isFavorite ? "favorited" : "favorite")
//                                .foregroundColor(presenter.isFavorite ? .yellow : .gray)
//                        }
//                        .padding(.trailing, 20)
//                    }
//                    VStack {
//
//                        Text(presenter.character.name)
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                        Text(presenter.character.species)
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                        // todo display date formatted
//                        Text("Created: \(formattedDate(from: presenter.character.created))")
//                            .font(.title)
//                            .foregroundColor(.white)
//
//                    }
//                    .background(Color.blue)
//                }
//                .background(Color.purple)
//            }
//            .background(Color.red)
//            .padding()
//            .padding(.top, 50)
//        }
//    }
    
    func formattedDate(from dateString: String) -> String {
        let date = dateString.dateFromString(dateString)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
