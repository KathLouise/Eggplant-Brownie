//
//  NewItemController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 10/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var calloriesField : UITextField?
    var delegate: AddAnItemDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    init(delegate: AddAnItemDelegate){
        super.init(nibName: "NewItemViewController", bundle: nil);
        self.delegate = delegate;
    }
    
    /*Adiciona um novo item e retorna para a tela anterior*/
    @IBAction func add() {
        let name = nameField!.text;
        let callories = Double((calloriesField!.text)!);
        
        if (name == nil || callories == nil || delegate == nil){
            return;
        }
        
        let item = Item(name: name!, calories: callories!);
        delegate?.add(item);
        
        print("Adding new item");
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true);
        }
    }

}
