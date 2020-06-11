//
//  CustomersFileAddress.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class CustomersFileAddress {
    
    static func getAddress() -> URL {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("customers.txt")
        var fileAddress = fileURL.absoluteString
        fileAddress = fileAddress.replacingOccurrences(of: "file://", with: "")
        return URL(string: fileAddress)!
        
    }
    
}
