//
//  CustomNavLink.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 10/06/24.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let destination: Destination
    let label: Label
    @ObservedObject var presenter: CharacterPresenter

    init(presenter: CharacterPresenter, destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.presenter = presenter
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination: CustomNavBarContainerView(presenter: presenter, content: {
                destination
            }).navigationBarHidden(true)
            ,
            label: {
                label
            })
    }
}

//struct CustomNavLink_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavView {
//            CustomNavLink(destination: Text("Destination")) {
//                Text("TEST")
//            }
//        }
//    }
//}
