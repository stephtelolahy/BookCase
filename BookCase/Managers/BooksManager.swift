//
//  BooksManager.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BooksManager: NSObject {
    
    func fetchBooks(completionHandler: @escaping (Array<Book>?, Error?) -> Swift.Void) {
        
        NetworkClient.sharedInstance.performGetRequest(urlString: "/books") { (json, error) in
            
            if error != nil {
                completionHandler(nil, error)
            } else {
                let jsonArray = json as! NSArray
                var books = Array<Book>()
                for object in jsonArray {
                    let book = Book(object as! NSDictionary)
                    books.append(book!)
                }
                completionHandler(books, nil)
            }
        }
    }
    
}
