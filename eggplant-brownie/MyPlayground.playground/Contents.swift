import UIKit
import PlaygroundSupport

class Meal{
    var name:String;
    var happiness:Int;
    var itens = Array<Item>();
    
    init(name:String, happiness: Int) {
        self.name = name;
        self.happiness = happiness;
    }
    
    func allCalories() -> Double {
        var total: Double = 0.0;
        
        for item in itens {
            total += item.calories;
        }
        return total;
    }
}

class Item{
    var name:String;
    var calories:Double;
    
    init(name:String, calories: Double) {
        self.name = name;
        self.calories = calories;
    }
}

let brownie = Meal(name: "eggplant brownie", happiness: 5);
print(brownie.name);

let item1 = Item(name: "eggplant", calories: 115);
let item2 = Item(name: "mignon", calories: 200);

brownie.itens.append(item1);
brownie.itens.append(item2);

print("All calories sum is: \(brownie.allCalories())");
