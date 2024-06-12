//
//  AppRouter.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//


import SwiftUI

struct AppRouter: View {
    private let router = CharacterRouter()

    var body: some View {
        router.createCharacterListView()
            .navigationBarHidden(true)
    }
}
