//
//  DataService.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/8/24.
//

import Foundation
import CoreLocation

struct DataService {
    
    //api key generated
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async -> [Business]{
        
        // check if api key is valid
        
        guard apiKey != nil else {
            
            //will return if not
            print("API key is missing")
            return []
        }
        
        // else create URL
        var lat = 35.665517
        var long = 139.770398
        
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10"){
            
            // create the URL Request
            
            var request = URLRequest(url: url)
                request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
                request.addValue("application/json", forHTTPHeaderField: "accept")
            
            //URL Session
            
            do {
               let (data, response) = try await URLSession.shared.data(for: request)
                
                
                
                
                
                //check resonse status code
                if let httpResponse = response as? HTTPURLResponse{
//                    print("Status code: \(httpResponse.statusCode)")
                    
                    
                    if httpResponse.statusCode == 200 {
                        //parse json
                        
                        let decoder = JSONDecoder()
                        
                        let result = try decoder.decode(BusinessSearch.self, from: data)
                        return result.businesses
                    } else{
                        let responseBody = String(data:data, encoding: .utf8) ?? "No response body"
                        print("Error: \(httpResponse.statusCode), Response Body: \(responseBody)")
                    }
                }
                
              
                
                
            } catch {
                print("Error during request:\(error.localizedDescription)")
            }
            
            
        } else {
            print("invalid URL.")
        }
        
        return []
    }
    
}
