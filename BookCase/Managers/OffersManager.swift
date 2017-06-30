//
//  OffersManager.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 26/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class OffersManager: NSObject {

    func fetchOffers(order:Order, completionHandler: @escaping (Array<Offer>?, Error?) -> Swift.Void) {
        
        var booksParam = ""
        for book in order.books {
            booksParam.append(book.isbn)
            booksParam.append(",")
        }
        let urlString = String.init(format: "/books/%@/commercialOffers", booksParam)
        
        NetworkClient.sharedInstance.performGetRequest(urlString: urlString, serviceType: .offers) { (data, error) in
            completionHandler(data as? Array<Offer>, error)
        }
    }
}
