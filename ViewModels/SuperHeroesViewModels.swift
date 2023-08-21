//
//  SuperHeroesViewModels.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//

import Foundation
import PromiseKit

class SuperHeroesListViewModel: ObservableObject {
    @Published var superHeroList: [SuperHeroViewModel] = []
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
// Create the SuperHero ViewModel in which every other models goes through its corensponding ViewModel
class SuperHeroViewModel: Identifiable, Hashable {
    let id = UUID()
    var hero: SuperHero
    init(hero: SuperHero){
        self.hero=hero
    }
    var name: String {
        return self.hero.name
    }
    var ID: String {
        return self.hero.id
    }
    var image: ImageViewModel {
        return ImageViewModel(image: self.hero.image)
    }
    var biography: BioViewModel {
        return BioViewModel(bio: self.hero.biography)
    }
    var poweratats : PowerStatsViewModel {
        return PowerStatsViewModel(powerstats: self.hero.powerstats)
    }
    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        // Use the hash value of the powerstats property
        hasher.combine(hero)
    }
    // Equatable protocol is required for Hashable
    static func ==(lhs: SuperHeroViewModel, rhs: SuperHeroViewModel) -> Bool {
        return lhs.hero == rhs.hero
    }
}
//Create the Bio ViewModel
class BioViewModel : Identifiable{
    let id = UUID()
    var bio: Bio
    init (bio: Bio){
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
    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        // Use the hash value of the powerstats property
        hasher.combine(bio)
    }
    // Equatable protocol is required for Hashable
    static func ==(lhs: BioViewModel, rhs: BioViewModel) -> Bool {
        return lhs.bio == rhs.bio
    }
}
// Create the Image ViewModel
class ImageViewModel: Identifiable, Hashable {
    let id = UUID()
    var image: Image
    init(image : Image){
        self.image = image
    }
    var url: String {
        return self.image.url
    }
    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        // Use the hash value of the powerstats property
        hasher.combine(image)
    }
    // Equatable protocol is required for Hashable
    static func ==(lhs: ImageViewModel, rhs: ImageViewModel) -> Bool {
        return lhs.image == rhs.image
    }
}
// Create the Powerstats ViewModel
class PowerStatsViewModel : Identifiable, Hashable {
    let id = UUID()
    var powerstats: Powerstats
    init (powerstats: Powerstats){
        self.powerstats = powerstats
    }
    var intelligence: String {
        return self.powerstats.intelligence
    }
    var strength: String {
        return self.powerstats.strength
    }
    var speed: String {
        return self.powerstats.speed
    }
    var durability: String {
        return self.powerstats.durability
    }
    var power: String {
        return self.powerstats.power
    }
    var combat: String {
        return self.powerstats.combat
    }
    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        // Use the hash value of the powerstats property
        hasher.combine(powerstats)
    }
    // Equatable protocol is required for Hashable
    static func ==(lhs: PowerStatsViewModel, rhs: PowerStatsViewModel) -> Bool {
        return lhs.powerstats == rhs.powerstats
    }
}











    
    
    
           
        
    

