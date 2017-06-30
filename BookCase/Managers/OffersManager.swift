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
        
        // TODO: pass json to model parsing function
        NetworkClient.sharedInstance.performGetRequest(urlString: urlString) { (json, error) in
            
            if error != nil {
                completionHandler(nil, error)
            }
            else {
                
                if let jsonResult = json as? [String: Any] {
                    if let jsonOffers = jsonResult["offers"] as? [[String: Any]] {
                        var offers = Array<Offer>()
                        for jsonOffer in jsonOffers {
                            if let offer = Offer(jsonOffer) {
                                offers.append(offer)
                            }
                        }
                        completionHandler(offers, nil)
                        return
                    }
                }
                
                let parsingEror = NSError(domain:"Failed parsing model", code:0, userInfo:nil)
                completionHandler(nil, parsingEror)
            }
        }
    }
}
