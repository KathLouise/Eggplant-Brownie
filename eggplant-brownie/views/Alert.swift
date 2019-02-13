//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 12/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller: UIViewController;
    
    init(controller:UIViewController){
        self.controller = controller;
    }
    
    func show(message: String = "Unexpected error.") {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertController.Style.alert);
        let button = UIAlertAction(title: "Understood", style: UIAlertAction.Style.cancel, handler: nil);
        
        alert.addAction(button);
        controller.present(alert, animated: true, completion: nil);
    }
}
