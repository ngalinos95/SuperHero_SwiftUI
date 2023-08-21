//
//  SuperheroModel.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//


import Foundation

struct SuperHero: Codable, Equatable, Hashable {
    var id: String
    var name: String
    var image: Image
    var biography: Bio
    var powerstats: Powerstats
}
struct Image: Codable, Equatable, Hashable {
    var url: String
}
// Create a model for the bio info of the character
struct Bio: Codable, Equatable, Hashable {
    var fullName: String  // Update variable name
    var alterEgos: String // Update variable name
    var aliases: [String]
    var placeOfBirth: String  // Update variable name
    var firstAppearance: String
    var publisher: String
    var alignment: String
    
    enum CodingKeys: String, CodingKey  {
        case fullName = "full-name"  // Map "full-name" JSON key to fullName
        case alterEgos = "alter-egos" // Map "alter-egos" JSON key to alterEgos
        case aliases
        case placeOfBirth = "place-of-birth"  // Map "place-of-birth" JSON key to placeOfBirth
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }
}
struct Powerstats: Codable, Equatable, Hashable {
    var intelligence: String
    var strength: String
    var speed: String
    var durability: String
    var power: String
    var combat: String
}





