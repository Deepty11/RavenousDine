//
//  PaymentView.swift
//  RavenousDine
//
//  Created by rehnuma.deepty on 16/10/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyCardNumber = ""
    @State private var tipSelected = "10"
    
    private let paymentTypes = ["Cash",
                        "Credit Cards",
                        "RavenousDine Points"]
    private let tipAmounts = ["10", "15", "20", "0"]
    
    private var totalWithTips: Float {
        return Float(order.total) + Float(order.total * (Int(tipSelected) ?? 0)) / 100
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?",
                       selection: $paymentType) {
                    // $ -> two way binding,
                    // means, write the value when the option in the pickerView changes
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                    
                }
                
                Toggle("Add loyalty card",
                       isOn: $addLoyaltyDetails.animation())
                
                if addLoyaltyDetails {
                    TextField("Enter your RDine ID",
                              text: $loyaltyCardNumber)
                }
                
            }
            
            Section(header: Text("ADD A TIP?")) {
                Picker("Percentage: ",selection: $tipSelected) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

            }
            
            Section(header: Text("Total: $\(totalWithTips.rounded())")
                .font(.title)) {
                    Button("Confirm Order") {
                        //
                    }

            }
        }
        .navigationTitle("Payement")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
