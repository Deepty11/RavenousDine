//
//  ItemDetail.swift
//  RavenousDine
//
//  Created by Rehnuma Reza on 15/10/22.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    .padding(EdgeInsets(top: 0,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 0))
                Text("Photo: \(item.photoCredit)")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(.black)
                    .padding(EdgeInsets(top: 0,
                                        leading: 0,
                                        bottom: 2,
                                        trailing: 5))
                    .offset(x: -5, y: -5)
                
            }
            
            Text(item.description)
                .padding(EdgeInsets(top: 0,
                                    leading: 5,
                                    bottom: 0,
                                    trailing: 5))
            
            Text("Order This")
                .foregroundColor(.blue)
                .fontWeight(.medium)
                .padding(10)
                .font(.title3)
            
            Spacer()
            
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
