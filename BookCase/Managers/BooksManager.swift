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
        
        NetworkClient.sharedInstance.performGetRequest(urlString: "/books", serviceType: .books) { (data, error) in
            completionHandler(data as? Array<Book>, error)
        }
    }
    
}
