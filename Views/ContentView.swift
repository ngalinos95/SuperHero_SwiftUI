//
//  ContentView.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//

import SwiftUI
import PromiseKit

struct ContentView: View {
    @ObservedObject var superHeroVM = SuperHeroesListViewModel()
    @State  var searchText = ""
    
    
    
    var body: some View {
        VStack {
            NavigationStack{
                List{
                    ForEach (searchText=="" ? superHeroVM.superHeroList
                             : superHeroVM.superHeroList.filter{ $0.name.lowercased().contains(searchText.lowercased()) } ){ hero in
                        NavigationLink{ HeroLink(hero: hero)
                                .navigationTitle(hero.name)
                            
                            
                            
                            
                        } label : {
                            HeroRow(hero: hero)
                        }
                        
                        
                        
                    }
                    
                }.searchable(text: $searchText)
                    .navigationTitle(" Heroes ")
                
            }
        }
        .onAppear{superHeroVM.fetchData()}
        
        
        
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
