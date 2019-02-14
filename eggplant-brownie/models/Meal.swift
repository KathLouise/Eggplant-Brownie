//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 02/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
    let name:String;
    let happiness:Int;
    let itens: Array<Item>;
    
    /*Como a classe deve ser desserializada*/
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String;
        self.happiness = aDecoder.decodeInteger(forKey: "happiness");
        self.itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>;
    }
    
    /*Como a classe deve ser serializada */
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name");
        aCoder.encode(happiness, forKey: "happiness");
        aCoder.encode(itens, forKey:"itens");
    }
    
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

