//
//  ContentView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for?",text: $query)
                .textFieldStyle(.roundedBorder)
            
            Button{
                //Do
            } label: {
                Text("Go")
                    .padding(.horizontal)
                    .padding(.vertical, 10)
            }
        }
        .padding()
        .task {
            let businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
