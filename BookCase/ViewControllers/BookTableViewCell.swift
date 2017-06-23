//
//  BookTableViewCell.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import SDWebImage

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
        let buttonTitle = String.init(format: "%d €", book.price)
        addButton.setTitle(buttonTitle, for: UIControlState.normal)
        coverImageView.sd_setImage(with: URL(string: book.cover!))
    }

    
    
    // MARK: - IBAction

    @IBAction func addButtonTouchUpInside(_ sender: Any) {
        self.delegate?.bookTableViewCell(self, didAddBook: self.book)
    }
}
