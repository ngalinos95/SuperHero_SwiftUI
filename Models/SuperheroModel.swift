//
//  SuperheroModel.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 16/6/23.
//


import Foundation

struct SuperHero : Codable , Equatable {
    //make var to let
    var id : String
    var name : String
    var image : Image
    var biography : Bio
}


struct Image : Codable ,Equatable {
    var url : String
}

//create a model for the bio info of the character
struct Bio: Codable , Equatable {
    var fullName: String  // Update variable name
    var alterEgos: String //Update variable name
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





