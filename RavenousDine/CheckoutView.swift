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
    @State private var isAlertPresented = false
    
    private let paymentTypes = ["Cash",
                        "Credit Cards",
                        "RavenousDine Points"]
    private let tipAmounts = ["10", "15", "20", "0"]
    
    private var totalWithTips: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let val =  NSNumber(value: Float(order.total) + Float(order.total * (Int(tipSelected) ?? 0)) / 100)
        return formatter.string(from: val) ?? "$0"
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
                .pickerStyle(.segmented)

            }
            
            Section(header: Text("Total: \(totalWithTips)")
                .font(.largeTitle)) {
                    Button("Confirm Order") {
                        isAlertPresented.toggle() // set false if was set true earlier, and vice-versa
                    }

            }
        }
        .navigationTitle("Payement")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Order Confirmed"),
            message: Text("Your total cost \(totalWithTips)"),
                  dismissButton: .default(Text("Ok")))
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
