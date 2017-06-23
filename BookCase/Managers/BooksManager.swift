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
    
    func booksManager(_ manager: BooksManager, didFailWithError error:NSError)
}

class BooksManager: NSObject {

    weak var delegate: BooksManagerDelegate?
    
    func fetchBooks() {

        // TODO: implement
        var books = [Book]()
        books.append(Book())
        books.append(Book())
        self.delegate?.booksManager(self, didSucceedWithBooks: books)
    }
    
}
