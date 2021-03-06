//
//  ConvertToJsonArray.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class ConvertToJsonArray {
    
    // convert array of strings to an json array
    static func convertStringArrayToJsonArray(stringArray: [String], completion: @escaping (GetCustomersResponse)->Void) {
        
        let jsonArray = NSMutableArray()
        stringArray.forEach { (string) in
            if let data = string.data(using: .utf8) {
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
                jsonArray.add(json)
            }
        }
        do {
            let response = try GetCustomersResponse(json: jsonArray)
            completion(response)
            
        } catch {}
        
    }
    
}
