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
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails));
        cell.addGestureRecognizer(recognizer);
        
        return cell;
    }
    
    /*Pego o evento de Long press do usuário e
      identifico a celula pressionada com long press*/
    @objc func showDetails(reconizer: UILongPressGestureRecognizer){
        if(reconizer.state == UILongPressGestureRecognizer.State.began){
            //UIView casting para UITableViewCell
            let cell = reconizer.view as! UITableViewCell;
            if let indexPath = tableView.indexPath(for: cell){
                let meal = meals[indexPath.row];
                //Chama uma função que mostra o alerta com as informações
                showModal(meal: meal);
            }
        }
    }
    
    func showModal(meal: Meal){
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert);
        // configura o botão para fechar a modal
        let ok = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel, handler: nil);
        
        //adiciona o botão na modal
        details.addAction(ok);
        
        //para somente apresentar a controller alert
        present(details, animated: true, completion: nil);
    }
}
