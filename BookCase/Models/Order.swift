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
    
    var books: [Book] = []
    
    var offers: [Offer] = [] {
        didSet {
            self.updateBestOffer()
        }
    }
    
    var totalPrice: Int {
        var result = 0
        for book in self.books {
            result = result + book.price
        }
        return result
    }
    
    var bestOffer: Offer?
    var bestPrice: Float?
    
    // MARK: - Public
    
    func addBook(aBook: Book) -> Bool {
        
        if self.books.contains(where: { book in book.isbn == aBook.isbn }) {
            return false
        }
        
        self.books.append(aBook)
        return true
    }
    
    // MARK: - Private
    
    private func updateBestOffer() {
        
        var bestOffer: Offer?
        var bestPrice = Float(self.totalPrice)
        for offer in offers {
            let price = offer.applyOffer(totalPrice: self.totalPrice)
            if (bestOffer == nil || price < bestPrice) {
                bestOffer = offer
                bestPrice = price
            }
        }
        
        self.bestOffer = bestOffer
        self.bestPrice = bestPrice
    }
}
