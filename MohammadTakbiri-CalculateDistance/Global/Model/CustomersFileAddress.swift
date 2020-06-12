//
//  CustomersFileAddress.swift
//  MohammadTakbiri-CalculateDistance
//
//  Created by mohammad takbiri on 6/11/20.
//  Copyright © 2020 Mohammad Takbiri. All rights reserved.
//

import Foundation

class CustomersFileAddress { // This class return address of the file that we saved before or should be saved there.
    
    static func getAddress() -> URL {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("customers.txt")
        return fileURL
        
    }
    
}
