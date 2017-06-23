//
//  BookTableViewCell.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit


protocol BookTableViewCellDelegate : class {
    
    func bookTableViewCell(_ cell: BookTableViewCell, didAddBook book:Book)
}


class BookTableViewCell: UITableViewCell {
    
    // MARK: - Fields
    
    var book: Book!
    weak var delegate: BookTableViewCellDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    // MARK: - Update
    
    func update(book: Book) {
        
        self.book = book
        titleLabel.text = book.title
        descriptionLabel.text = book.fullDescription()
        addButton.setTitle(String(book.price), for: UIControlState.normal)
    }

    
    
    // MARK: - IBAction

    @IBAction func addButtonTouchUpInside(_ sender: Any) {
        self.delegate?.bookTableViewCell(self, didAddBook: self.book)
    }
}