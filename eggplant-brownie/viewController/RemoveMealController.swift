//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 13/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller: UIViewController;
    
    init(controller:UIViewController) {
        self.controller = controller;
    }
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void){
        //Mostra o alerta com as informações
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert);
        // configura o botão para fechar a modal
        let ok = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel, handler: nil);
        //remove uma refeição da tabela
        let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler);
    
        //adiciona os botões na modal
        details.addAction(ok);
        details.addAction(remove);
    
        //para somente apresentar a controller alert
        controller.present(details, animated: true, completion: nil);
    }
}
