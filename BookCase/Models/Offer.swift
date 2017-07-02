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
    
    var type: String
    var value: Int
    var sliceValue: Int?
    
    // MARK: - Initialization
    
    init?(_ json: [String: Any]) {
        
        guard let type = json["type"] as? String else {
            return nil
        }
        guard let value = json["value"] as? Int else {
            return nil
        }
        let sliceValue = json["sliceValue"] as? Int
        
        self.type = type
        self.value = value
        self.sliceValue = sliceValue
    }
    
    // MARK: - Helper
    
    var fullDescription: String {
        
        if self.type == "percentage" {
            
            return String.init(format: "une réduction de %d%% s’appliquant sur le prix de l’ensemble des livres", self.value)
            
        } else if self.type == "minus" {
            
            return String.init(format: "une déduction directement applicable en caisse d’un montant de %d€", self.value)
            
        } else if self.type == "slice" {
            
            if let sliceValue = self.sliceValue {
                return String.init(format: "un remboursement de %d€ par tranche de %d€ d’achat. ", self.value, sliceValue)
            }
            
        }
        
        return ""
    }
    
    func applyOffer(totalPrice:Int) -> Float{
        
        if self.type == "percentage" {
            
            return Float(totalPrice * (100 - self.value)/100)
            
        } else if self.type == "minus" {
            
            return Float(totalPrice - self.value)
            
        } else if self.type == "slice" {
            
            if let sliceValue = self.sliceValue {
                let slices = totalPrice / sliceValue
                return Float(totalPrice - slices * self.value)
            }
        }
        
        return Float(totalPrice)
    }
    
}
