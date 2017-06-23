//
//  Book.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class Book: NSObject {
    
    // MARK: - Fields
    
    var isbn: String!
    var title: String!
    var price: Int!
    var cover: String!
    var synopsis: Array<String>!

    
    // MARK - Constructor
    
    convenience init?(_ jsonDictionary: NSDictionary) {
        self.init()

        if let isbn = jsonDictionary["isbn"] as? String {
            self.isbn = isbn
        }
        
        if let title = jsonDictionary["title"] as? String {
            self.title = title
        }
        
        if let price = jsonDictionary["price"] as? Int {
            self.price = price
        }
        
        if let cover = jsonDictionary["cover"] as? String {
            self.cover = cover
        }
        
        if let synopsis = jsonDictionary["synopsis"] as? Array<String> {
            self.synopsis = synopsis
        }
    }
    
    func fullDescription() -> String {
        return self.synopsis.joined(separator: "\n")
    }
    
}
