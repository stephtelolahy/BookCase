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
        
        let session = URLSession(configuration:URLSessionConfiguration.default)
        
        // We perform HTTP request by disabling iOS transport security for our server domain
        // https://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/
        
        let urlString = "http://henri-potier.xebia.fr/books"
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                completionHandler(nil, error)
                
            } else {
                
                let jsonArray = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                var books = Array<Book>()
                for object in jsonArray! {
                    let book = Book(object as! NSDictionary)
                    books.append(book!)
                }
                
                DispatchQueue.main.async {
                    completionHandler(books, nil)
                }
            }
        }
        
        task.resume()
    }
    
}
