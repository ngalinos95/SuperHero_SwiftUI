//
//  Router.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 21/7/23.
//

import SwiftUI
class Router: ObservableObject {
    @Published var path = NavigationPath()
    func reset() {
       path = NavigationPath()
    }
}
