//
//  ContentView.swift
//  RavenousDine
//
//  Created by Rehnuma Reza on 13/10/22.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self,
                                  from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                ItemRow(item: item)
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
