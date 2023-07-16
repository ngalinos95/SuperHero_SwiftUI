//
//  SuperHeroesViewModels.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//

import Foundation
import PromiseKit


class SuperHeroesListViewModel : ObservableObject {
    @Published var superHeroList : [SuperHeroViewModel] = []
    var heroesService : SuperHeroServiceProtocol
    init( heroesService: SuperHeroServiceProtocol = SuperHeroService()) {
        self.heroesService = heroesService
    }
    
    func fetchData() {
        firstly {
            when(fulfilled: (1...100).map { i in
                heroesService.getSuperHero(id: String(i))
            })
        }.done { heroes in
            for hero in heroes {
                self.superHeroList.append(SuperHeroViewModel(hero: hero))
            }
            self.superHeroList.sort { Int($0.ID)! < Int($1.ID)! }
        }.catch { error in
            // Handle error
        }
    }
    
    
    
}


//Create the SuperHero ViewModel in which every other models goes through its corensponding ViewModel
class SuperHeroViewModel :  Identifiable {
    let id = UUID()
    var hero : SuperHero
    
    init(hero : SuperHero){
        self.hero=hero
    }
    var name : String {
        return self.hero.name
    }
    
    var ID : String {
        return self.hero.id
    }
    
    var image : ImageViewModel {
        return ImageViewModel(image: self.hero.image)
    }
    var biography : BioViewModel {
        return BioViewModel(bio: self.hero.biography)
    }
    
}

//Create the Bio ViewModel
class BioViewModel : Identifiable{
    let id = UUID()
    var bio : Bio
    init (bio : Bio){
        self.bio=bio
    }
    
    var fullName: String {
        return self.bio.fullName
    }
    var alterEgos: String {
        return self.bio.alterEgos
    }
    var aliases: [String] {
        return self.bio.aliases
    }
    var placeOfBirth: String {
        return self.bio.placeOfBirth
    }
    var firstAppearance: String {
        return self.bio.firstAppearance
    }
    var publisher: String {
        return self.bio.publisher
    }
    var alignment: String {
        return self.bio.alignment
    }
}

//Create the Image ViewModel
class ImageViewModel : Identifiable {
    let id = UUID()
    
    var image : Image
    
    init(image : Image){
        self.image = image
    }
    
    var url : String {
        return self.image.url
    }
}










    
    
    
           
        
    

