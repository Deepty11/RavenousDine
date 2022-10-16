//
//  OrderView.swift
//  RavenousDine
//
//  Created by rehnuma.deepty on 16/10/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        OrderedItemRow(item: item)
                    }
                }
                
                Section {
                    NavigationLink(destination: {
                        CheckoutView()
                    }) {
                        Text("Place Order")
                    }
                    
                }
            }
            .navigationTitle("Order")
            
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
