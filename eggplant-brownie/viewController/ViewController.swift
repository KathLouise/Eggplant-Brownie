//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 29/01/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    @IBOutlet var nameField : UITextField?
    @IBOutlet var happinessField : UITextField?
    @IBOutlet var tableView: UITableView?
    var delegate: AddAMealDelegate?
    var delateItem: AddAnItemDelegate?
    var selected = Array<Item> ()
    
    var itens = [Item(name: "Eggplant", calories: 10),
                 Item(name: "Brownie", calories: 10),
                 Item(name: "Chocolate", calories: 100),
                 Item(name: "Muffin", calories: 50),
                 Item(name: "Carrot", calories: 10),
                 Item(name: "Rice", calories: 50),
                 Item(name: "Beef", calories: 120),
                 Item(name: "Potato", calories: 20)]
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem));
        navigationItem.rightBarButtonItem = newItemButton;
    }
    
    func add(_ item: Item){
        itens.append(item);
        if let table = tableView{
            table.reloadData()
        }
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self);
        if let navigationController = navigationController{
            navigationController.pushViewController(newItem, animated: true);
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let item = itens[row];
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil);
        cell.textLabel!.text = item.name;
        return cell;
    }
    
    /*Pega a celula da tabela que foi clicada
      Verifica se ela já foi selecionada ou não
      Se não foi, coloca um checkmark e adiciona na lista
      Caso contrário, retira o checkmark  e retira da lista*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if(cell.accessoryType == UITableViewCell.AccessoryType.none){
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark;
                let item = itens[indexPath.row];
                selected.append(item);
            } else {
                cell.accessoryType = UITableViewCell.AccessoryType.none;
                let item = itens[indexPath.row];
                //compare o item que passamos com todos os elementos dentro do array
                if let position = selected.index(of: item){
                    //se achar, remova
                    selected.remove(at: position);
                }
            }
        }
    }

    @IBAction func add(){
        if (nameField == nil || happinessField == nil ){
            return;
        }
        
        let name:String = nameField!.text!;
        if let happiness:Int = Int(happinessField!.text!) {
            let meal = Meal(name: name, happiness: happiness, itens: selected);
            print("Eaten \(meal.name) with \(meal.happiness) and \(meal.itens)");
            
            if let delegateMeals = delegate {
                delegateMeals.add(meal);
            }
        }
        
        //se houver alguma coisa no navigationController
        //desempilha as views ativas.
        if let navigation = navigationController{
            navigation.popViewController(animated: true);
        }
    }
}
