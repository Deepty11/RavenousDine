//
//  ItemRow.swift
//  RavenousDine
//
//  Created by Rehnuma Reza on 13/10/22.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(.gray, in: Circle().stroke(lineWidth: 2.0))
            VStack(alignment: .leading,
                   spacing: 1.0) {
                Text(item.name)
                    .bold()
                Text("$\(item.price)")
                
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) {
                // \.self means -> the string itself is unique, there is no other identifier for string
                restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(MenuUtils.menuItemResrictionDict[restriction])
                    .clipShape(Circle())
                    
            }
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
