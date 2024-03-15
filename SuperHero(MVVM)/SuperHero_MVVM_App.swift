//
//  SuperHero_MVVM_App.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos,   on 16/6/23.
//

import SwiftUI

@main
struct SuperHero_MVVM_App: App {
    @ObservedObject var superHeroVM = SuperHeroesListViewModel()
    @ObservedObject var router = Router()
    var body: some Scene {
        WindowGroup {
            VStack{
                ContentView()
                    .environmentObject(router)
                    .environmentObject(superHeroVM)
            }
            .onAppear{superHeroVM.fetchData()}
            // url has scheme - host - lastPathComponent-pathComponents= number
            .onOpenURL { url in
                guard let scheme = url.scheme , scheme == "heroesStack" else {return}
                guard let heroe = url.host else {return}
                if let foundHero = superHeroVM.superHeroList.first(where: {$0.name == heroe} ) {
                    router.reset()
                    router.path.append(foundHero)
                    if url.pathComponents.count == 2 {
                        if url.lastPathComponent == "PowerStats" {
                            router.path.append(foundHero.poweratats)
                        }
                    }
                }
            }
        }
    }
}

