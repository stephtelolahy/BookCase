//
//  Book.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

// Parsed Book model from API call
class Book: NSObject {
    
    // MARK: - Fields
    
    var isbn: String
    var title: String
    var price: Int
    var cover: String
    var synopsis: [String]
    
    //MARK: - Initialization
    
    init?(_ json: [String: Any]) {
        guard let isbn = json["isbn"] as? String else {
            return nil
        }
        guard let title = json["title"] as? String else {
            return nil
        }
        guard let price = json["price"] as? Int else {
            return nil
        }
        guard let cover = json["cover"] as? String else {
            return nil
        }
        guard let synopsis = json["synopsis"] as? [String] else {
            return nil
        }
        
        self.isbn = isbn
        self.title = title
        self.price = price
        self.cover = cover
        self.synopsis = synopsis
    }
    
    // MARK: - Helper
    
    var fullDescription: String {
        return self.synopsis.joined(separator: "\n")
    }
    
}
