//
//  ItemStore.swift
//  Homepwner
//
//  Created by BrainX Technologies on 14/04/2023.
//

import Foundation


class ItemStore{
    var items: [Item] = []
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        items.append(newItem)
        return newItem
    }
    
    init(){
        for _ in 0..<5 {
            createItem()
        }
    }
}
