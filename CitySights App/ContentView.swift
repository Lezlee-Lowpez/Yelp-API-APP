//
//  ContentView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.
//yelp API key
//ESDZnYcRb9qBrE-jo3cgLh6gDYzon9IU0U6vIZ1h7mrBhHGGoQRcM7vfvSoVrE6ZxX0CDYTQ1BB88qyDIwb1tfsfkWZ_8DLhPcg4W130oNIZWnpPCs3XepTMebGOZnYx
import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
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
    }
}

#Preview {
    ContentView()
}
