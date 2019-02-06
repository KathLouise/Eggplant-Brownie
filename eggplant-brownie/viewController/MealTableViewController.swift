//
//  MealTableViewController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 05/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class MealTableViewController : UITableViewController {
    let meals = [Meal(name: "Eggplant Brownie", happiness: 5),
                 Meal(name: "Jacky's sushi", happiness: 5)];

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
