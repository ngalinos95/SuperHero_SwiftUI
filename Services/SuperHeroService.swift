//
//  SuperHeroService.swift
//  SuperHero(MVVM)
//
//  Created by Nikos Galinos,   on 16/6/23.
//

import Foundation
import PromiseKit

protocol SuperHeroServiceProtocol {
    func getSuperHero(id: String) -> Promise<SuperHero>
}
class SuperHeroService: SuperHeroServiceProtocol{
    func getSuperHero (id: String ) -> Promise<SuperHero> {
        Promise {seal in
            guard let url = URL(string: "https://www.superheroapi.com/api.php/6240691359382436/\(id)") else {
                return seal.reject(NSError(domain: "Invalid Url", code: 0))
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request){ data , _ , error in
                if let error = error  {
                    seal.reject(error)
                }else if let data = data {
                    do {
                        let superhero = try JSONDecoder().decode(SuperHero.self, from: data)
                        seal.fulfill(superhero)
                    }
                    catch{
                        seal.reject(error)
                    }
                }
            }.resume()
        }
    }
}
