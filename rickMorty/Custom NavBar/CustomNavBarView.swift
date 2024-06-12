//
//  CustomNavBarView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 10/06/24.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var presenter: CharacterPresenter
    let showBackButton: Bool
    let showStarButton: Bool
    
    init(presenter: CharacterPresenter, showBackButton: Bool = true, showStarButton: Bool = true) {
            self.presenter = presenter
            self.showBackButton = showBackButton
            self.showStarButton = showStarButton
        }
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            navLogo
            Spacer()
            if showStarButton {
                starButton
            }
        }
        .padding(.top, 50)
        .background(Color.customBlackBg.ignoresSafeArea(edges: .top))
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("backBtn")
        })
        .padding(.leading, 16)
    }
    
    private var starButton: some View {
        CustomNavLink(
            presenter: presenter,
            destination:
                FavoriteCharactersView(presenter: presenter)
                    .customNavigationStarBtnHidden(true)
        ) {
            Image("favoriteMenu")
        }

    }

    private var navLogo: some View {
        Image("navLogo")
    }
}

//struct CustomNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            CustomNavBarView(presenter: CharacterPresenter())
//            Spacer()
//        }
//    }
//}
