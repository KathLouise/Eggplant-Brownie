//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 05/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class MealTableViewController : UITableViewController, AddAMealDelegate{
    var meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Jacky's sushi", happiness: 5)];
    
    //Recebe uma lista de refeições e adiciona no Array
    func add(_ meal:Meal){
        meals.append(meal);
        tableView.reloadData();
    }
    
    /*Antes de seguir o caminho, avisa o controller da View
     seguinte que deve invocar o proprio UITableViewController */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            //Controller para onde eu estou indo
            let view = segue.destination as! ViewController;
            //a sua variavel mealsTable sou eu mesmo
            view.delegate = self;
        }
    }

    /*Retorna o numero de linhas da tabela*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    /*Retorna o conteúdo de cada linha da tabela, para que o Table View
    saiba o que deve exibir. */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //pega o numero da linha
        let row = indexPath.row;
        //pega o conteúdo da linha
        let meal = meals[row];
        //cria uma celula
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: nil);
        //conteúdo da celula = nome da refeiçao
        cell.textLabel!.text = meal.name;
        
        return cell;
    }
}
