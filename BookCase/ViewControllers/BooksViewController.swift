//
//  BooksViewController.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController, UITableViewDataSource, BooksManagerDelegate, BookTableViewCellDelegate {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Fields
    
    var booksManager: BooksManager?
    var books: Array<Book>?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Books", comment: "")
        
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
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
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.books != nil ? self.books!.count : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book = self.books![indexPath.row]
        let cellIdentifier = String(describing: BookTableViewCell.self)
        let cell: BookTableViewCell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as! BookTableViewCell
        cell.delegate = self
        cell.update(book: book)
        return cell
    }
    
    
    // MARK: - BooksManagerDelegate
    
    func booksManager(_ manager: BooksManager, didSucceedWithBooks books: Array<Book>) {
        
        self.books = books
        self.tableView.reloadData()
        self.tableView.isHidden = false
    }
    
    func booksManager(_ manager: BooksManager, didFailWithError error: NSError) {
        
        self.infoLabel.text = NSLocalizedString("Sorry, an error occured when getting books.", comment: "")
    }
    
    
    // MARK: - BookTableViewCellDelegate
    
    func bookTableViewCell(_ cell: BookTableViewCell, didAddBook book: Book) {
        
        NSLog("Added book %@", book.title)
    }
    
}
