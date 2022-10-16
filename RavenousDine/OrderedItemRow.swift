//
//  OrderedItemRow.swift
//  RavenousDine
//
//  Created by rehnuma.deepty on 16/10/22.
//

import SwiftUI

struct OrderedItemRow: View {
    var item: MenuItem
    var body: some View {
        HStack {
            Text(item.name)
                .padding(4)
            Spacer()
            Text("$\(item.price)")
                .padding(4)
        }
    }
}

struct OrderedItemRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderedItemRow(item: MenuItem.example)
    }
}
