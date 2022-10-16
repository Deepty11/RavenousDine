//
//  RavenousDineApp.swift
//  RavenousDine
//
//  Created by Rehnuma Reza on 13/10/22.
//

import SwiftUI

@main
struct RavenousDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
