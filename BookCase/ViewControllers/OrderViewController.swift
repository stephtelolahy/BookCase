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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Votre panier", comment: "")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 120
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetchOffers()
    }
    
    // MARK: - Helpers
    
    func fetchOffers() {
        
        if self.order?.books.count == 0 {
            self.infoLabel.text = "Votre panier est vide"
            self.tableView.isHidden = true
            return;
        }
        
        self.showLoadingView()
        
        self.offersManager.fetchOffers(order: self.order!, completionHandler: { (offers, error) in
            
            self.hideLoadingView()
            
            if error != nil {
                
                self.infoLabel.text = error!.localizedDescription
                self.tableView.isHidden = true
                
            } else if offers?.count == 0 {
                
                self.infoLabel.text = NSLocalizedString("Aucune offre n'est applicable à votre commande", comment: "")
                self.tableView.isHidden = true
                
            } else {
                
                self.order!.offers = offers!
                
                self.orderButton.setTitle(String.init(format: "Commander à %.2f €", self.order!.bestPrice!), for: .normal)
                self.offerLabel.text = String.init(format: "Vous avez %@",   self.order!.bestOffer!.fullDescription)
                
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        })
    }
    
    // MARK: - IBAction
    
    @IBAction func editButtonTouchUpInside(_ sender: Any) {
        self.showToast(message: NSLocalizedString("Vous pouvez supprimer un live en le glissant vers la gauche", comment: ""))
    }
}

extension OrderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.order!.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book = order!.books[indexPath.row]
        let cellIdentifier = String(describing: OrderedBookTableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! OrderedBookTableViewCell
        cell.updateWithBook(book: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.order!.books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.fetchOffers()
        }
    }
}
