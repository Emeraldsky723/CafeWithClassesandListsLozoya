//
//  ContentView.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/1/26.
//

import SwiftUI
import SwiftData

@Observable
class AppData {
    
    static let shared = AppData()
    var items = makeItemsArray()
    private init() {}
}




struct ContentView: View {
    @Query var cart: [ItemStruct]
    @State var cartCount = 0
    var body: some View {
        VStack {
            Text("Hello welcome to Wandy's")
            NavigationStack {
                HStack {
                    Spacer()
                    NavigationLink {
                        CartView()
                    } label: {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 45)
                            .overlay(
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Spacer()
                                        Text("\(makeCartCount(cart: cart))")
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    Spacer()
                                    Spacer()
                                }
                            )
                    }

                }

                List {
                    ForEach(0..<AppData.shared.items.count, id: \.self) { i in
                        NavigationLink {
                            DetailView(item: AppData.shared.items[i])
                        } label: {
                            Text(AppData.shared.items[i].name)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }

        }
        .padding()
        
    }
}
func makeCartCount(cart: [ItemStruct]) -> Int{
    var count = 0
    for i in cart{
        count += i.count
    }
    return count
}
func makeItemsArray() -> [ItemStruct] {

    let ingrediants1 = [
        IngrediantStruct(
            name: "Bacon",
            calories: 170,
            addonPrice: 2.0,
            amount: 1
        ),
        IngrediantStruct(
            name: "Bun",
            calories: 150,
            addonPrice: 0.0,
            amount: 1
        ),
        IngrediantStruct(
            name: "Burger Patty",
            calories: 200,
            addonPrice: 3.0,
            amount: 1
        ),
        IngrediantStruct(
            name: "Cheese",
            calories: 40,
            addonPrice: 0.5,
            amount: 1
        ),
    ]
    let ingrediants2 = [
        IngrediantStruct(
            name: "Chicken",
            calories: 190,
            addonPrice: 0.50,
            amount: 1
        ),
        IngrediantStruct(
            name: "Breading",
            calories: 190,
            addonPrice: 0.25,
            amount: 1
        ),
    ]
    let ingrediants3 = [
        IngrediantStruct(
            name: "Chicken",
            calories: 210,
            addonPrice: 2.50,
            amount: 1
        ),
        IngrediantStruct(
            name: "Bun",
            calories: 150,
            addonPrice: 0.0,
            amount: 1
        ),
        IngrediantStruct(
            name: "Lettuce",
            calories: 10,
            addonPrice: 0.20,
            amount: 1
        ),
    ]
    let ingrediants4 = [
        IngrediantStruct(
            name: "Potato",
            calories: 165,
            addonPrice: 1.50,
            amount: 1
        ),
        IngrediantStruct(
            name: "Breading",
            calories: 100,
            addonPrice: 1.50,
            amount: 1
        ),
        IngrediantStruct(name: "Oil", calories: 70, addonPrice: 0.5, amount: 1),
    ]
    let ingrediants5 = [
        IngrediantStruct(
            name: "Water",
            calories: 0,
            addonPrice: 0.10,
            amount: 1
        ),
        IngrediantStruct(
            name: "Milk",
            calories: 150,
            addonPrice: 0.40,
            amount: 1
        ),
        IngrediantStruct(
            name: "Chocolate Flavoring",
            calories: 5,
            addonPrice: 0.20,
            amount: 1
        ),
    ]

    var itemsArray: [ItemStruct] = []
    let item1 = ItemStruct(
        name: "Baconater",
        price: 15.50,
        calories: 890,
        image: "Burger",
        ingredients: ingrediants1
    )
    let item2 = ItemStruct(
        name: "Chicken Nuggets",
        price: 7.25,
        calories: 470,
        image: "Nuggets",
        ingredients: ingrediants2
    )
    let item3 = ItemStruct(
        name: "Classic Chicken Sandwich",
        price: 8.25,
        calories: 550,
        image: "Chicken Sandwich",
        ingredients: ingrediants3
    )
    let item4 = ItemStruct(
        name: "Fries",
        price: 2.46,
        calories: 260,
        image: "Fries",
        ingredients: ingrediants4
    )
    let item5 = ItemStruct(
        name: "Chocolate Frosty",
        price: 2.01,
        calories: 310,
        image: "Frosty",
        ingredients: ingrediants5
    )
    itemsArray.append(item1)
    itemsArray.append(item2)
    itemsArray.append(item3)
    itemsArray.append(item4)
    itemsArray.append(item5)

    return itemsArray

}

#Preview {
    ContentView()
}
