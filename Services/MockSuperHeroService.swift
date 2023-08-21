//
//  MockSuperHeroService.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos, Vodafone on 14/7/23.
//

import Foundation
import PromiseKit

class MockSuperHeroService: SuperHeroServiceProtocol {
    func getSuperHero(id: String) -> Promise<SuperHero> {
        if Int(id)! >= 0 && Int(id)! <= 731 {
            // Create a mock Hero fo the mockService
            let mockHero =
            SuperHero(id: id, name: "Boom-Boom",
                      image: Image(url: "https://www.superherodb.com/pictures2/portraits/10/100/400.jpg"),
                      biography: Bio(fullName: "Tabitha Smith", alterEgos: "Meltdown", aliases: [
                        "Time Bomb",
                        "Boomer",
                        "Meltdown",
                        "Tabby",
                        "Firecracker",
                        "Mutate #35",
                        "Nancy Forrester"
                      ], placeOfBirth: "-", firstAppearance: "Secret Wars II #5",
                                     publisher: "Meltdown", alignment: "good"),
                      powerstats: Powerstats(intelligence: "38",
                                             strength: "10",
                                             speed: "12", durability: "42", power: "57", combat: "64"))
            return Promise.value(mockHero)
        } else {
            return Promise(error: NSError(domain: "invalid Hero Id", code: 0))
        }
    }
}
