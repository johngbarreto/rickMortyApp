//
//  CustomNavBarPreferenceKeys.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 10/06/24.
//

import Foundation
import SwiftUI


// default is not hidden, make it hidden by setting it to true on usage

struct CustomNavBarBackBtnHiddenPrefKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}

// default is not hidden, make it hidden by setting it to true on usage

struct CustomNavBarStarBtnHiddenPrefKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
    
}


extension View {
    func customNavigationBackBarBtnHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarBackBtnHiddenPrefKey.self, value: hidden)
    }
    
    func customNavigationStarBtnHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavBarStarBtnHiddenPrefKey.self, value: hidden)
    }
    
    func customNavBarItems(backBtnHidden: Bool, starBtnHidden: Bool) -> some View {
        self
            .customNavigationBackBarBtnHidden(backBtnHidden)
            .customNavigationStarBtnHidden(starBtnHidden)
    }
}
