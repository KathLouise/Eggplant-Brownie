//
//  DaoMeal.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 14/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class DaoMeal {
    /*Pega o diretorio de documentos do usuário para salvar o arquivo*/
    func getDocumentsDirectory() -> URL{
        let dirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return dirs[0];
    }
    
    /*Monta o caminho do diretorio, fornecendo o nome do arquivo*/
    func getURLMeals() -> URL{
        return getDocumentsDirectory().appendingPathComponent("egg-plant-meals.dados");
    }
    
    /*Tenta gravar as refeiçoes dentro do arquivo
     o caminho e o arquivo são obtidos atraves da função getURLMeals*/
    func save(_ meals: Array<Meal>){
        do{
            let path = getURLMeals();
            print(path);
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false);
            try data.write(to: path);
        } catch {
            print("Couldn't write file");
        }
    }
    
    func load() -> Array<Meal> {
        do {
            let data = try Data(contentsOf: getURLMeals());
            if let loadedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Meal>{
                return loadedMeals;
            } 
        } catch {
            print("Couldn't read file");
        }
        return [];
    }
}
