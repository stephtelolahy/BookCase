//
//  NetworkClient.swift
//  BookCase
//
//  Created by Stéphano TELOLAHY on 27/06/2017.
//  Copyright © 2017 Stéphano TELOLAHY. All rights reserved.
//

import UIKit

// Shared Network client that performs API call 
// and return results on main thread
// This object will implements Command pattern
class NetworkClient: NSObject {

    // MARK: - Constants
    
    static let sharedInstance = NetworkClient()
    
    
    // MARK: - fields
    
    // We perform HTTP request by disabling iOS transport security 
    // for our server domain
    // https://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/
    let ServerRootUrl = "http://henri-potier.xebia.fr"
    
    let session = URLSession(configuration:URLSessionConfiguration.default)
    
    
    // MARK: - Methods
    
    func performGetRequest(urlString:String, serviceType:ServiceType,  completionHandler: @escaping (Any?, Error?) -> Swift.Void) {
        
        let url = URL(string:  ServerRootUrl.appending(urlString))
        
        let task = self.session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            
            guard data != nil else {
                DispatchQueue.main.async {
                    completionHandler(nil, NSError(domain:"Missing data", code:0, userInfo:nil))
                }
                return
            }
            
            guard let model = ServiceAtlas.parseModelForService(serviceType:serviceType, data: data!) else {
                DispatchQueue.main.async {
                    completionHandler(nil, NSError(domain:"Parsing error", code:0, userInfo:nil))
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(model, nil)
            }
        }
        
        task.resume()
    }
    
}
