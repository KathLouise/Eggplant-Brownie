//
//  DaoItem.swift
//  eggplant-brownie
//
//  Created by Katheryne Graf on 14/02/2019.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation
import UIKit

class DaoItem{
    /*Pega o diretorio de documentos do usuário para salvar o arquivo*/
    func getDocumentsDirectory() -> URL{
        let dirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return dirs[0];
    }
    
    /*Monta o caminho do diretorio, fornecendo o nome do arquivo*/
    func getURLItems() -> URL{
        return getDocumentsDirectory().appendingPathComponent("egg-plant-items.dados");
    }
    
    /*Tenta gravar as refeiçoes dentro do arquivo
     o caminho e o arquivo são obtidos atraves da função getURLMeals*/
    func save(_ itens: Array<Item>){
        do{
            let path = getURLItems();
            print(path);
            let data = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false);
            try data.write(to: path);
        } catch {
            print("Couldn't write file");
        }
    }
    
    func load() -> Array<Item>{
        do {
            let data = try Data(contentsOf: getURLItems());
            if let loadedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Item>{
                return loadedItems;
            }
        } catch {
            print("Couldn't read file");
        }
        return [];
    }

}
