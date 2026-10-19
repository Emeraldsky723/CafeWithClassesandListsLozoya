//
//  IngrediantsStruct.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/4/26.
//
import Foundation
import SwiftData
//Identifiable, Hashable, and id from AI
@Model
class IngrediantStruct{
    //let id = UUID()
    var name = ""
    var calories = 0
    var addonPrice = 0.0
    var amount = -1
    
    init(name: String = "", calories: Int = 0, addonPrice: Double = 0.0, amount: Int = 1) {
        self.name = name
        self.calories = calories
        self.addonPrice = addonPrice
        self.amount = amount
    }
    
}

