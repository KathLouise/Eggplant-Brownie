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
    
    /*Tenta converter uma string opcional para Double opcional*/
    func convertToDouble(_ text:String?) -> Double?{
        if let number = text{
            return Double(number);
        }
        return nil;
    }
    
    /*Pega o que foi digitado nos forms e
     tenta compor um novo item.
     Senão conseguir, retorna nulo*/
    func getItemFromForm() -> Item? {
        if let name = nameField?.text{
            if let callories = convertToDouble(calloriesField?.text){
                let item = Item(name: name, calories: callories);
                return item;
            }
        }
        return nil;
    }
    
    /*Adiciona um novo item e retorna para a tela anterior*/
    @IBAction func add() {
        if let item = getItemFromForm(){
            if let delegateItem = delegate {
                delegateItem.add(item);
                print("Adding new item");
                if let navigationController = navigationController {
                    navigationController.popViewController(animated: true);
                } else {
                    Alert(controller: self).show(message: "Unable to navigate, but item was successfully added");
                }
                return;
            }
        }
        Alert(controller: self).show();
    }

}
