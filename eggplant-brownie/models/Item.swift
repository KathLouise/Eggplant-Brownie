//
//  Item.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 02/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class Item: NSObject, NSCoding{
    
    let name:String;
    let calories:Double;
    
    init(name:String, calories: Double) {
        self.name = name;
        self.calories = calories;
    }
    
    /*Como a classe deve ser desserializada*/
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String;
        self.calories = aDecoder.decodeDouble(forKey: "calories");
    }
    
    /*Como a classe deve ser serializada*/
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name");
        aCoder.encode(calories, forKey: "calories");
    }
}

func == (first: Item, second: Item) -> Bool {
    return (first.name == second.name) && (first.calories == second.calories);
}
