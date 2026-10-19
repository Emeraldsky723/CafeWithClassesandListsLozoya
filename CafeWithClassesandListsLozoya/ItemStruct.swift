//
//  ItemStruct.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/4/26.
//

import Foundation
import SwiftData
//identifiable and let id came from ai
//both of them make it to where the ItemStruct can be individually determined with a unique id in my loops
@Model
class ItemStruct: Identifiable{
   var id = UUID()
    var name: String = ""
    var price = 0.0
    var calories = 0.0
    var image = ""
    var ingredients: [IngrediantStruct] = []
    var count = 0
    
    init(name: String, price: Double, calories: Double, image: String, ingredients: [IngrediantStruct]) {
        self.name = name
        self.price = price
        self.calories = calories
        self.image = image
        self.ingredients = ingredients
        count = 0
    }
    init(name: String, price: Double, calories: Double, image: String, ingredients: [IngrediantStruct], count: Int) {
        self.name = name
        self.price = price
        self.calories = calories
        self.image = image
        self.ingredients = ingredients
        self.count = count
    }
    init(){
        name = ""
        price = 0.0
        calories = 0.0
        image = ""
        ingredients = []
        count = 0
    }
}

