//
//  ContentView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedTab = 0
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorySelection = "restaurants"
    @State var query = ""
    @FocusState var queryBoxFocused:Bool
    
    var body: some View {
        
        @Bindable var model = model
        
        VStack{
            
            HStack {
                TextField("What are you looking for?",text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                
                Button{
                    queryBoxFocused = false
                    //perform a search
                    model.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6.0))
                }
                
              
            }
            .padding(.horizontal)
            
            //Query options. Show if text box is focused
            if queryBoxFocused {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal,40)
            }
            
            
            //show picker
            Picker("", selection: $selectedTab){
                Text("List")
                    .tag(0)
                
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            //show map or list
            if selectedTab == 1 {
                MapView()
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            } else {
                ListView()
                    .onTapGesture {
                        queryBoxFocused = false
                    }
            }
          
        }
        .onAppear{
            model.getBusinesses(query: nil, options: nil, category: nil)
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        
        var optionsArray = [String]()
        
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
}

#Preview {
    HomeView()
        .environment(BusinessModel())
}
