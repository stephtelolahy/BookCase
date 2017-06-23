//
//  BooksManager.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit


protocol BooksManagerDelegate : class {
    
    func booksManager(_ manager: BooksManager, didSucceedWithBooks books:Array<Book>)
    
    func booksManager(_ manager: BooksManager, didFailWithError error:Error)
}

class BooksManager: NSObject {

    weak var delegate: BooksManagerDelegate?
    
    func fetchBooks() {
        
        let session = URLSession(configuration:URLSessionConfiguration.default)
        
        let urlString = "http://henri-potier.xebia.fr/books"
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                self.delegate?.booksManager(self, didFailWithError: error!)
                
            } else {
                
                let jsonArray = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                var books = Array<Book>()
                for object in jsonArray! {
                    
                    let book = Book(json: object as! [String : Any])
                    if book != nil {
                        books.append(book!)
                    } else {
                        // TODO: error parsing
                    }
                }                
                self.delegate?.booksManager(self, didSucceedWithBooks: books)
            }
        }
        
        task.resume()
    }
    
}
