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
        
        // TODO: return offer description
        
        return String.init(format: "Vous bénéficiez d'une remise de %d €", self.value)
    }

}
