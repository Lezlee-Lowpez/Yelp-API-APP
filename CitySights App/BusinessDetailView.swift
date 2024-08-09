//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/9/24.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}
