//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    
    @State var businessModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(businessModel)
        }
    }
}
