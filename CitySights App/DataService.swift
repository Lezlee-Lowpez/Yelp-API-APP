//
//  DataService.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.
//

import Foundation

struct DataService {
    
    //api key generated
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business]{
        
        // check if api key is valid
        
        guard apiKey != nil else {
            
            //will return if not
            return []
        }
        
        // else create URL
        
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=10"){
            
            // create the URL Request
            
            var request = URLRequest(url: url)
                request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "accept")
            
            //URL Session
            
            do {
               let (data, response) = try await URLSession.shared.data(for: request)
                
                //Parse the JSON
                
                var decoder = JSONDecoder()
                
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
                
            } catch {
                print(error)
            }
            
            
        }
        return []
    }
    
}
