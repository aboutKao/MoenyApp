//
//  Item.swift
//  MoenyApp
//
//  Created by SHIH-YING PAN on 2019/11/15.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

struct Item:Codable {
    var money: Int
    var name: String
    
    static func getItems() -> [Item]{
        if let data = UserDefaults.standard.data(forKey: "items") {
            if let items = try? JSONDecoder().decode([Item].self, from: data) {
                
                return items
            }
        }
        return[Item]()
    }
    static func save(items:Item) {
        var myNewItems = [Item]()
      let newItems = UserDefaults.standard.data(forKey: "items")
        
        if newItems != nil{
         myNewItems = try! JSONDecoder().decode([Item].self, from: newItems!)
            myNewItems.append(items)
        }else{
            myNewItems.append(items)
        }
        
        
        
        if let data = try? JSONEncoder().encode(myNewItems) {
            UserDefaults.standard.set(data, forKey: "items")
            print(data)
        }
    }
}
    
    struct ItemData:Codable {
        var data:Item
    }

