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
        
        // TODO: build request Url with order books
        let urlString = "http://henri-potier.xebia.fr/books/c8fabf68-8374-48fe-a7ea-a00ccd07afff,a460afed-e5e7-4e39-a39d-c885c05db861/commercialOffers"
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
