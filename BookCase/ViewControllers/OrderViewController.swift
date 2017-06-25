//
//  OrderViewController.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    // MARK: - Fields
    
    var order: Order?
    let offersManager = OffersManager()
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Panier", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (self.order?.books.count == 0) {
           self.infoLabel.text = "Votre panier est vide"
            return;
        }
        
        self.showLoadingView()
        
        self.offersManager.fetchOffers(order: self.order!, completionHandler: { (offers, error) in
            
            self.hideLoadingView()
            
            if error != nil {
                self.infoLabel.text = error?.localizedDescription
            } else {
                // TODO: handle offers
            }
        })
    }

}
