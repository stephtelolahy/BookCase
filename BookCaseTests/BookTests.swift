//
//  BookTests.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 30/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import XCTest

class BookTests: XCTestCase {
    
    func testBookInitializationSucceeds() {
        
        let book = Book(["isbn": "c8fabf68-8374-48fe-a7ea-a00ccd07afff", "title": "Henri Potier à l'école des sorciers", "price": 35, "cover": "http://henri-potier.xebia.fr/hp0.jpg", "synopsis": ["A", "B", "C"]])
        XCTAssertNotNil(book)
    }
    
    func testBookInitializationFails() {
        
        let emptyBook = Book([:])
        XCTAssertNil(emptyBook)
        
        let missingTitleBook = Book(["isbn": "c8fabf68-8374-48fe-a7ea-a00ccd07afff", "price": 35, "cover": "http://henri-potier.xebia.fr/hp0.jpg", "synopsis": ["A", "B", "C"]])
        XCTAssertNil(missingTitleBook)
    }
    
}
