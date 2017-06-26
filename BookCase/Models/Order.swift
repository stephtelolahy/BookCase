//
//  Order.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 25/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

// Model presenting an order containing books collection
// Some offers are applied to this order. These are defined by API
class Order: NSObject {

    // MARK: - Fields
    
    var books: Array<Book> = []
    var offers: Array<Offer> = []
    var bestOffer: Offer?
    var price: Int?
    
    // MARK: - Public
    
    func addBook(aBook: Book) -> Bool {
        
        if self.books.contains(where: { book in book.isbn == aBook.isbn }) {
            return false
        }
        
        self.books.append(aBook)
        return true
    }
    
    func setOffers(offers: Array<Offer>) {
        self.offers = offers
        
        // TODO: compute best offer and price
        
        var totalPrice = 0
        for book in self.books {
            totalPrice = totalPrice + book.price
        }
        self.bestOffer = offers[0]
        self.price = totalPrice
    }
}
