//
//  Item.swift
//  Homepwner
//
//  Created by BrainX Technologies on 14/04/2023.
//

import Foundation


class Item: NSObject {
    var name: String
    var price: Int
    var serialNumber: String?
    var dateOfCreation: Date
    
    
    init(name: String, price: Int, serialNumber: String? , dateOfCreation: Date) {
        self.name = name
        self.price = price
        self.serialNumber = serialNumber
        self.dateOfCreation = dateOfCreation
        
        super.init()
    }
    
    convenience init(random: Bool) {
        
      self.init(name: generateRandomItemName(), price: Int.random(in: 500...1000), serialNumber: generateSerialNumber(), dateOfCreation: Date())
    }
}




private func generateRandomItemName() -> String {
     let adjectives = ["Blue", "Green", "Red", "Yellow", "Purple", "Pink", "Orange", "Black", "White", "Gray"]
     let nouns = ["Shirt", "Pants", "Hat", "Shoes", "Gloves", "Socks", "Jacket", "Dress", "Skirt", "Shorts"]
     
     let randomAdjectiveIndex = Int.random(in: 0..<adjectives.count)
     let randomNounIndex = Int.random(in: 0..<nouns.count)
     
     return "\(adjectives[randomAdjectiveIndex]) \(nouns[randomNounIndex])"
 }
 
 private func generateSerialNumber() -> String{
     let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
     let digits = "0123456789"
     
     let letter1 = letters.randomElement()!
     let letter2 = letters.randomElement()!
     let digit1 = digits.randomElement()!
     let digit2 = digits.randomElement()!
     let digit3 = digits.randomElement()!
     
    return "\(letter1)\(letter2)\(digit1)\(digit2)\(digit3)"
 }
