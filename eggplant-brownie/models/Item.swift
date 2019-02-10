//
//  Item.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 02/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class Item: Equatable{
    
    let name:String;
    let calories:Double;
    
    init(name:String, calories: Double) {
        self.name = name;
        self.calories = calories;
    }
}

func == (first: Item, second: Item) -> Bool {
    return (first.name == second.name) && (first.calories == second.calories);
}
