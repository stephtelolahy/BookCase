//
//  OrderedBookTableViewCell.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 26/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import SDWebImage

class OrderedBookTableViewCell: UITableViewCell {

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Update
    
    func updateWithBook(book: Book) {
        self.textLabel?.text = book.title
        self.imageView?.sd_setImage(with: URL(string: book.cover!))
    }
}
