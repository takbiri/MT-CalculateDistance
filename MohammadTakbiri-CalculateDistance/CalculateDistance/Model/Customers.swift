//
//  JsonHandler.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

struct Customers: Equatable {
    let lat: NSString
    let lng: NSString
    let name: String
    let user_id: Int
    
    
    init?(dict: [String: Any]) {
        
        
      guard let latitude = dict["latitude"] as? NSString,
            let longitude = dict["longitude"] as? NSString,
            let name = dict["name"] as? String,
            let user_id = dict["user_id"] as? Int
            else { return nil }
        
        self.lat = latitude
        self.lng = longitude
        self.name = name
        self.user_id = user_id
        
    }
}
