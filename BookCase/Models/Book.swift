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
    var synopsis: String!

    
    // MARK - Constructor
    
    init?(json: [String: Any]) {
        guard let isbn = json["isbn"] as? String,
            let title = json["title"] as? String,
            let price = json["price"] as? Int,
            let cover = json["cover"] as? String,
            let synopsis = json["synopsis"] as? String
            else {
                return nil
        }
        
        self.isbn = isbn
        self.title = title
        self.price = price
        self.cover = cover
        self.synopsis = synopsis
    }
    
//    convenience init?(_ jsonDictionary: NSDictionary) throws  {
//        self.init()
//
//        if let isbn = jsonDictionary["isbn"] as? String {
//            self.isbn = isbn
//        }
//        
//        if let title = jsonDictionary["title"] as? String {
//            self.title = title
//        }
//        
//        if let price = jsonDictionary["price"] as? Int {
//            self.price = price
//        }
//        
//        if let cover = jsonDictionary["cover"] as? String {
//            self.cover = cover
//        }
//        
//        if let synopsis = jsonDictionary["synopsis"] as? String {
//            self.synopsis = synopsis
//        }
//    }
    
}
