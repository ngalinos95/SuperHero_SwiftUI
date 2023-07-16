//
//  HeroRow.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//

import SwiftUI

struct HeroRow: View {
    var hero : SuperHeroViewModel?
    var body: some View {
        if let hero = hero {
            Text(hero.name )
        }
    }
}

struct HeroRow_Previews: PreviewProvider {
    static var previews: some View {
        HeroRow()
    }
}
