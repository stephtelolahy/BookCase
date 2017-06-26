//
//  Offer.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 26/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

// Parsed Offer model from API call
class Offer: NSObject {
    
    // MARK: - Fields
    
    var type: String!
    var value: Int!
    var sliceValue: Int!
    
    // MARK - Constructor
    
    convenience init?(_ json: NSDictionary) {
        self.init()
        
        if let type = json["type"] as? String {
            self.type = type
        }
        
        if let value = json["value"] as? Int {
            self.value = value
        }
        
        if let sliceValue = json["sliceValue"] as? Int {
            self.sliceValue = sliceValue
        }
    }

    // MARK: - Helper
    
    func fullDescription() -> String {
        
        if self.type == "percentage" {
            
            return String.init(format: "une réduction de %d%% s’appliquant sur le prix de l’ensemble des livres", self.value)
            
        } else if self.type == "minus" {
            
            return String.init(format: "une déduction directement applicable en caisse d’un montant de %d€", self.value)
            
        } else if self.type == "slice" {
            
            return String.init(format: "un remboursement de %d€ par tranche de %d€ d’achat. ", self.value, self.sliceValue)
            
        } else {
            
            return ""
        }
    }
    
    func applyOffer(totalPrice:Int) -> Float{
        
        if self.type == "percentage" {
            
            return Float(totalPrice * (100 - self.value)/100)
            
        } else if self.type == "minus" {
            
            return Float(totalPrice - self.value)
            
        } else if self.type == "slice" {
            
            let slices = totalPrice / self.sliceValue
            return Float(totalPrice - slices * self.value)
            
        } else {
            
            return Float(totalPrice)
        }
    }

}
