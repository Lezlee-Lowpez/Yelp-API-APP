//
//  MapView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedBusinessId: String?
    
    var body: some View {
        Map(selection: $selectedBusinessId){
            ForEach(model.businesses, id: \.id) { b in
                Marker(b.name ?? "restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                .tag(b.id ?? "none")
            }
         
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // find the business that matches the id
            let business = model.businesses.first { business in
                business.id == selectedBusinessId
            }
            // if the business is found, set it as the selected one
            if let business = business {
                model.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}
