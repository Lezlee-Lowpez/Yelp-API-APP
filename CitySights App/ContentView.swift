//
//  ContentView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        
        VStack{
            
            
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
            List(businesses) {b in
                Text(b.name ?? "nil")
            }
        }
        
        
        .padding()
        .task {
             businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
