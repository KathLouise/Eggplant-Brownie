import UIKit
import PlaygroundSupport

let calories = [50.5, 300, 400, 450, 500, 650];

func allCalories(calories: Array<Double>) -> Double {
    var total:Double = 0;
    
    for calorie in calories{
        total += calorie;
        print(calorie);
    }
    
    return total;
}

print("Calories: \(allCalories(calories:calories))");

func calculaSoma(valores:Array<Double>) -> Double {
    var soma: Double = 0
    for valor in valores {
        soma += valor
    }
    return soma
}

print("Valores: \(calculaSoma(valores:calories))");
