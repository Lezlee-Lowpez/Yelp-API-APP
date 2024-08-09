//
//  TextHelper.swift
//  CitySights App
//
//  Created by Lesley Lopez on 8/9/24.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        // static funcs allow you to call the method without having to create an instance of the struct seperately e.g you just call TextHelper.distanceAwayText
        // instead of var helper = TextHelper()
        // then helper.distanceAwayText
        
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        } else {
            return "\(Int(round(meters))) m away"
        }
    }
    
    
    static func roundTheRating(value: Double) ->Double {
        return (value * 2).rounded(.down) / 2.0
    }
    
    
}
