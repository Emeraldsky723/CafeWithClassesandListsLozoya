//
//  CartView.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/6/26.
//

import SwiftUI
import SwiftData
struct CartView: View {
    @State var total = 0.0
    @Environment(\.modelContext) var context
    @Query var cart: [ItemStruct]
    var body: some View {
        Text("Cart")
            .onAppear(){
                total = 0.0
                for i in 0..<cart.count{
                    for ii in 0..<cart.count{
                        
                        if cart[ii].name == cart[i].name{
                            cart[i].count = cart[ii].count
                        }
                    }
                }
                
                
                for i in 0..<cart.count{
                    total += cart[i].price * Double(cart[i].count)
                }
                
            }
        
        List{
            ForEach(0..<cart.count, id: \.self){ i in
                NavigationLink(cart[i].name + " \(cart[i].count)x", destination: DetailView(item: cart[i]))
                
            }
        }
        Text("Your total is " + String(format: "$%.2f", total))
        Button("Clear Cart"){
            try? context.delete(model: ItemStruct.self)
            try? context.save()
            total = 0.0
        }
    }
}

#Preview {
    CartView()
}
