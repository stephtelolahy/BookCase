//
//  ServiceAtlas.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 30/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

// Enum used to parse a json result to corresponding model
enum ServiceType {
    case books
    case offers
}

class ServiceAtlas: NSObject {
    
    static func parseModelForService(serviceType: ServiceType, data:Data) -> Any? {
        
        switch serviceType {
        case .books:
            return parseBooks(data:data)
            
        case .offers:
            return parseOffers(data:data)
        }
    }
    
    private static func parseBooks(data: Data) -> [Book]? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
            return nil
        }
        
        guard let jsonBooks = json else {
            return nil
        }
        
        var books: [Book] = []
        for jsonBook in jsonBooks {
            if let book = Book(jsonBook) {
                books.append(book)
            }
        }
        return books
    }
    
    private static func parseOffers(data: Data) -> [Offer]? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        
        guard let jsonResult = json else {
            return nil
        }
        
        guard let jsonOffers = jsonResult["offers"] as? [[String: Any]] else {
            return nil
        }
        
        var offers: [Offer] = []
        for jsonOffer in jsonOffers {
            if let offer = Offer(jsonOffer) {
                offers.append(offer)
            }
        }
        return offers
    }
    
}
