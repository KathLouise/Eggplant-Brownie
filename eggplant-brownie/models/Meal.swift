//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 02/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class Meal{
    let name:String;
    let happiness:Int;
    let itens: Array<Item>;
    
    init(name:String, happiness: Int, itens: Array<Item> = []) {
        self.name = name;
        self.happiness = happiness;
        self.itens = itens;
    }
    
    func allCalories() -> Double {
        var total: Double = 0.0;
        
        for item in itens {
            total += item.calories;
        }
        return total;
    }
    
    func details() -> String {
        var message = "Happiness: \(happiness)";
        for item in itens{
            message += "\n \(item.name) - Calories: \(item.calories)";
        }
        return message;
    }
}

