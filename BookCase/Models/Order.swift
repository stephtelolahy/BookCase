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

    var books: Array<Book> = []
    
    // Safe add book
    func addBook(aBook: Book) -> Bool {
        
        if self.books.contains(aBook) {
            return false
        }
        
        self.books.append(aBook)
        return true
    }
}
