//
//  DetailView.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/6/26.
//

import SwiftUI
import SwiftData
struct DetailView: View {
    let item: ItemStruct
    @State var counter = 0
    //google
    @Query var cart: [ItemStruct]
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    var body: some View {
        
        Text(item.name)
        Image(item.image)
            .resizable()
            .frame(maxWidth: 400, maxHeight: 300)
        Text("Ingredients")
        List{
            ForEach(item.ingredients, id: \.self){i in
                Text(i.name)
            }
        }
        HStack{
            Button{
                counter += 1
            }
            label:{
                Text("+")
                    .foregroundStyle(.black)
            }
            
            Text("\(counter)")
            
            Button{
                if counter > 0{
                    counter -= 1
                }
            }
            label:{
                Text("-")
                    .foregroundStyle(.black)
            }
        }
        Button{
           // AppData.shared.items[itemIndex].count += counter
            
            if let existingItem = cart.first(where: { $0.name == item.name }) {
                existingItem.count += counter
            }
            else{
                let cartItem = ItemStruct(name: item.name, price: item.price, calories: item.calories, image: "", ingredients: item.ingredients, count: item.count)
                cartItem.count = counter
                context.insert(cartItem)
            }

            try? context.save()

            
          //  AppData.shared.cartCount += counter
            //google :)
            dismiss()

        }                
                label:{
            Text("Add to Cart")
        }
    }
}

#Preview {
    DetailView(item: ItemStruct())
}
