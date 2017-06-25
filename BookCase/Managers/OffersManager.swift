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
        
        let session = URLSession(configuration:URLSessionConfiguration.default)
        
        var booksParam = ""
        for book in order.books {
            booksParam.append(book.isbn)
            booksParam.append(",")
        }
        
        let urlString = String.init(format: "http://henri-potier.xebia.fr/books/%@/commercialOffers", booksParam)
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                
            } else {
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! NSDictionary
                let jsonArray = json!["offers"] as! NSArray
                var offers = Array<Offer>()
                for object in jsonArray {
                    let offer = Offer(object as! NSDictionary)
                    offers.append(offer!)
                }
                
                DispatchQueue.main.async {
                    completionHandler(offers, nil)
                }
            }
        }
        
        task.resume()
    }
}
