//
//  BooksViewController.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderButton: UIBarButtonItem!
    
    // MARK: - Fields
    
    let booksManager = BooksManager()
    let order = Order()
    var books: [Book] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Tous les livres", comment: "")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        
        self.fetchBooks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateOrderButton()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let orderViewController = segue.destination as! OrderViewController
        orderViewController.order = self.order
    }
    
    // MARK: - Helpers
    
    func updateOrderButton() {
        UIView.performWithoutAnimation {
            self.orderButton.title = String.init(format: "Panier (%d)", self.order.books.count)
        }
    }
    
    private func fetchBooks() {
        
        self.showLoadingView()
        
        self.booksManager.fetchBooks { (books, error) in
            
            self.hideLoadingView()
            
            if error != nil {
                self.infoLabel.text = error!.localizedDescription
                self.tableView.isHidden = true
            } else if books != nil {
                self.books = books!
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
    }
}

extension BooksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book = self.books[indexPath.row]
        let cellIdentifier = String(describing: BookTableViewCell.self)
        let cell: BookTableViewCell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as! BookTableViewCell
        cell.delegate = self
        cell.update(book: book)
        return cell
    }
}

extension BooksViewController: BookTableViewCellDelegate {
    
    func bookTableViewCell(_ cell: BookTableViewCell, didAddBook book: Book) {
        
        if self.order.addBook(aBook: book) {
            self.updateOrderButton()
            self.showToast(message: String.init(format: "%@ a été ajouté à votre panier", book.title))
        } else {
            self.showToast(message: "Ce livre est déjà dans votre panier")
        }
    }
}
