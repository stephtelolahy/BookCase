//
//  BooksViewController.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, BooksManagerDelegate {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK - Lifecycle
    
    var booksManager: BooksManager?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Books", comment: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.booksManager = BooksManager()
        self.booksManager!.delegate = self
        self.booksManager?.fetchBooks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK - BooksManagerDelegate
    
    func booksManager(_ manager: BooksManager, didSucceedWithBooks books: Array<Book>) {
        
        self.tableView.isHidden = false
        
    }
    
    func booksManager(_ manager: BooksManager, didFailWithError error: NSError) {
        
    }
    
}
