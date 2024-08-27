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
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
                .fullScreenCover(isPresented:$needsOnboarding) {
                    //TODO on dismiss
                    needsOnboarding = false
                } content: {
                    OnBoardingView()
                        .environment(businessModel)
                }
                .onAppear{
                    if needsOnboarding == false {
                        businessModel.getUserLocation()
                    }
                }
            
        }
    }
}
