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
                if let jsonBooks = json as? [[String: Any]] {
                    var books = Array<Book>()
                    for jsonBook in jsonBooks {
                        if let book = Book(jsonBook) {
                            books.append(book)
                        }
                    }
                    completionHandler(books, nil)
                    return
                }
                
                let parsingEror = NSError(domain:"Failed parsing model", code:0, userInfo:nil)
                completionHandler(nil, parsingEror)
            }
        }
    }
    
}
