//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/21/24.
//

import Foundation


@Observable
class BusinessModel {
    
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    
    
    func getBusinesses() {
        
        Task {
            businesses = await service.businessSearch()
        }
        
    }
}
