//
//  CustomNavView.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 10/06/24.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    @ObservedObject var presenter: CharacterPresenter

    init(presenter: CharacterPresenter, @ViewBuilder content: () -> Content) {
        self.presenter = presenter
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            CustomNavBarContainerView(presenter: presenter) {
                content
            }
          .navigationBarHidden(true)
        }
        .background(Color.clear)
    }
}

//struct CustomNavView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Initialize a CharacterPresenter instance and pass it to CustomNavView
//        let presenter = CharacterPresenter(interactor: pres, router: <#CharacterRouterProtocol#>)
//        return CustomNavView(presenter: presenter) {
//            Color.red.ignoresSafeArea()
//        }
//    }
//}
