//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 29/01/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    var mealsTable: MealTableViewController?    

    @IBAction func add(){
        if (nameField == nil || happinessField == nil ){
            return;
        }
        
        let name:String = nameField!.text!;
        if let happiness:Int = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness);
            print("Eaten \(meal.name) with \(meal.happiness)");
            
            if let mealsList = mealsTable {
                mealsList.add(meal: meal);
            }
        }
        
        //se houver alguma coisa no navigationController
        //desempilha as views ativas.
        if let navigation = navigationController{
            navigation.popViewController(animated: true);
        }
    }
}
