//
//  UIViewController+Loading.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showLoadingView() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoadingView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showToast(message: String) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .text;
        hud.detailsLabel.text = message;
        hud.offset = CGPoint.init(x: hud.offset.x, y: hud.offset.y + self.view.bounds.height / 2)
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 2)
    }
    
}
