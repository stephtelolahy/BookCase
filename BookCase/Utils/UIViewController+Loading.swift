//
//  UIViewController+Loading.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 23/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import HKProgressHUD

extension UIViewController {
    
    func showLoadingView() {
        _ = HKProgressHUD.show(addedToView: self.view, animated: true)
    }
    
    func hideLoadingView() {
        _ = HKProgressHUD.hide(addedToView: self.view, animated: true)
    }
    
}
