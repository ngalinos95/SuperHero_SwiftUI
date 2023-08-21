//
//  ContentView.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//

import SwiftUI
import PromiseKit

struct ContentView: View {
    @EnvironmentObject var superHeroVM : SuperHeroesListViewModel
    @EnvironmentObject var router : Router
    @State  var searchText = ""
    var body: some View {
        NavigationStack(path: $router.path){
            VStack {
                List{
                    ForEach (searchText=="" ? superHeroVM.superHeroList
                             : superHeroVM.superHeroList.filter{ $0.name.lowercased().contains(searchText.lowercased()) } ){ hero in
                        NavigationLink(value: hero) {
                            HeroRow(hero:hero)
                        }
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle(" Heroes ")
                .navigationDestination(for: SuperHeroViewModel.self) { hero in
                    HeroLink(hero: hero)
                }
                
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SuperHeroesListViewModel())
            .environmentObject(Router())
    }
}



