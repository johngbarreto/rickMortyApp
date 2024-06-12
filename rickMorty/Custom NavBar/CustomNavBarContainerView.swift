//
//  CustomNavBarContainerView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 10/06/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackBtn: Bool = true
    @State private var showStarBtn: Bool = true
    @ObservedObject var presenter: CharacterPresenter

    init(presenter: CharacterPresenter, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.presenter = presenter
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(presenter: presenter, showBackButton: showBackBtn, showStarButton: showStarBtn)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .onPreferenceChange(CustomNavBarBackBtnHiddenPrefKey.self,
                            perform: { value in
            self.showBackBtn = !value
            
        })

        .onPreferenceChange(CustomNavBarStarBtnHiddenPrefKey.self,
                            perform: { value in
            self.showStarBtn = !value
        })
    }
    
}
