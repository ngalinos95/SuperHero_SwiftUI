//
//  HeroLink.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos on 18/6/23.
//

import SwiftUI

struct HeroLink: View {
    var hero: SuperHeroViewModel
    var body: some View {
        VStack{
            AsyncImage(url: URL(string:hero.image.url) , scale: 2.0)
                .frame(width: 230, height: 230)
                .cornerRadius(40)
            ScrollView{
                Grid(horizontalSpacing:60 , verticalSpacing: 30 ){
                    GridRow(alignment: .center){
                        Text("Full Name:")
                            .font(.system(size: 20))
                            .bold()
                        Text(hero.biography.fullName)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                    }
                    GridRow(alignment: .center) {
                        
                        Text("Alter Egos:")
                            .font(.system(size: 20))
                            .bold()
                        Text(hero.biography.alterEgos)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                    }
                    GridRow(alignment: .center) {
                        Text("Place of Birth:")
                            .font(.system(size: 20))
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                            .bold()
                        Text(hero.biography.placeOfBirth)
                            .bold()
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                    }
                    GridRow(alignment: .center) {
                        Text("Alignment:")
                            .font(.system(size: 20))
                            .bold()
                        Text(hero.biography.alignment)
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                    }
                }
                .padding(10)
                .frame(maxWidth: 350)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 0.8, green: 0.9, blue: 1)
                        .gradient
                        .opacity(0.6)
                    )
                )
            }
            HStack{
                Text("First appearance: in \(hero.biography.firstAppearance)")
                    .bold()
                    .padding(.bottom,30)
                    .font(.system(size: 14))
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(red: 0.8, green: 0.8, blue: 0.8).opacity(0.7))
        .navigationTitle(hero.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("See Powestats", value: hero.poweratats)
                    .buttonStyle(.bordered)
            }
        }
        .navigationDestination(for: PowerStatsViewModel.self) {powerstats in
            PowerStatsView(powerstats: powerstats)
                .navigationTitle("Powers of \(hero.name)")
        }
    }
}






