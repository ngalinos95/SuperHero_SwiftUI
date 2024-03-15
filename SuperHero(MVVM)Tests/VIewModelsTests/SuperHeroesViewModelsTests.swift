//
//  SuperHeroesViewModelsTests.swift
//  SuperHero(MVVM)Tests
//
//  Created by Nikos Galinos,   on 14/7/23.
//

import XCTest
import SwiftUI
@testable import SuperHero_MVVM_
import PromiseKit
final class SuperHeroesViewModelsTests: XCTestCase {

    var superHeroVM : SuperHeroesListViewModel!
    
    override func setUp()  {
        super.setUp()
        //Given
        superHeroVM = SuperHeroesListViewModel(heroesService: MockSuperHeroService())
    }
    
    override func tearDown() {
        //Clean up the test
        superHeroVM = nil
        super.tearDown()
    }
    
    func testFetchData() {
        let expectation = XCTestExpectation(description: "Get fetchData expectation")
        
        // Create an observer for the @Published superHeroList property
        let observer = superHeroVM.$superHeroList
            .sink { heroes in
                if heroes.count == 100 {
                    expectation.fulfill()
                }
            }
        
        // Call fetchData
        superHeroVM.fetchData()
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 10)
        
        // Clean up the observer
        observer.cancel()
        
        // Then
        XCTAssertEqual(superHeroVM.superHeroList.count, 100)
    }
   

}
