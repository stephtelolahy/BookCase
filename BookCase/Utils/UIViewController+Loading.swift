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
    
}
