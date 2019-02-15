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
    
    var itens: Array<Item> = []
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem));
        navigationItem.rightBarButtonItem = newItemButton;
        self.itens = DaoItem().load();
    }
    
    /*Verifica se a tabela existe
      Se existir, adiciona o item e atualiza os dados
      Senão, mostra uma mensagem de alerta na tela*/
    func add(_ item: Item){
        itens.append(item);
        DaoItem().save(itens)
        if let table = tableView{
            table.reloadData()
        } else {
            Alert(controller:self).show(message: "Unable to update de table");
        }
    }
    
    @objc func showNewItem() {
        let newItem = NewItemViewController(delegate: self);
        if let navigationController = navigationController{
            navigationController.pushViewController(newItem, animated: true);
        } else {
            Alert(controller:self).show();
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
    
    /*adiciona os itens no array de selecionados
    para compor uma refeição que esta sendo adicionada*/
    func addItens(indexPath: IndexPath){
        let item = itens[indexPath.row];
        selected.append(item);
    }
    
    /*Procura dentro do array de selecionados
    pelo item que foi desmarcado, para retira-lo
    Senão encontrar, mostra uma mensagem de erro.*/
    func removeItens(indexPath: IndexPath){
        let item = itens[indexPath.row];
        //compare o item que passamos com todos os elementos dentro do array
        if let position = selected.index(of: item){
            //se achar, remova
            selected.remove(at: position);
        } else {
            Alert(controller: self).show();
        }
    }
    
    /*Verifica se a celula foi marcada ou não,
     Se não foi, então marca e adiciona no array
     Senão, desmarca e retira do array. */
    func checkmarkCell(cell: UITableViewCell, indexPath: IndexPath){
        if(cell.accessoryType == UITableViewCell.AccessoryType.none){
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark;
            addItens(indexPath: indexPath);
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.none;
            removeItens(indexPath: indexPath);
        }
    }
    
    /*Tenta pegar o valor da celula que foi pressionada,
     Se conseguir, valida se ela foi marcada ou não
     para marca-la ou desmarca-la.
     Se não conseguir pegar a celula, apresenta uma mensagem
     de erro padrão*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            checkmarkCell(cell: cell, indexPath: indexPath);
        } else {
            Alert(controller: self).show();
        }
    }
    
    /* recebo uma string opcional e tento converte-la
    para um Int opcional.
     Se conseguir, retorna um Int opcional.
     Senão conseguir, retorna nulo*/
    func convertToInt(_ text:String?) -> Int?{
        if let number = text{
            return Int(number);
        }
        return nil;
    }
    
    /*Pega o que foi digitado nos forms e selecionado na tabela
     de ingredientes e tenta compor uma nova refeiçao.
     Senão conseguir, retorna nulo*/
    func getMealFromForm() -> Meal? {
        if let name = nameField?.text{
            if let happiness = convertToInt(happinessField?.text){
                let meal = Meal(name: name, happiness: happiness, itens: selected);
                print("Eaten \(meal.name) with \(meal.happiness) and \(meal.itens)");
                return meal;
            }
        }
        return nil;
    }
    
    /*Se conseguir compor uma nova refeiçao e tenta
    adiciona-a na tabela de refeiçoes.
     Caso não consiga, então mostra um alerta*/
    @IBAction func add(){
        if let meal = getMealFromForm(){
            if let delegateMeals = delegate{
                delegateMeals.add(meal);
                //se houver alguma coisa no navigationController
                //desempilha as views ativas.
                if let navigation = navigationController{
                    navigation.popViewController(animated: true);
                } else {
                    Alert(controller: self).show(message: "Unable to navigate, but meal was successfully added");
                }
                return;
            }
        }
        Alert(controller: self).show();
    }
}
